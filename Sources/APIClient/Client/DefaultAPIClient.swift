//
//  DefaultAPIClient.swift
//
//
//  Created by Yazan Qaisi on 24/02/2024.
//

import Foundation
import Alamofire
import Core

public final class DefaultAPIClient {
    public let configuration: APIConfiguration
    private let session: Session
    private var interceptor: Interceptor?

    public init(
        configuration: APIConfiguration,
        @ArrayBuilder<RequestInterceptor> interceptors: @escaping () -> [RequestInterceptor] = { [] }
    ) {
        self.configuration = configuration
        self.session = Session(configuration: configuration.urlSessionConfiguration)
        self.interceptor = Interceptor(interceptors: interceptors())
    }
}

extension DefaultAPIClient: APIClient {
    public func execute<Request>(_ request: Request) async throws -> APIResponse<Request.Response> where Request : APIRequest {
        guard NetworkReachabilityManager.default?.isReachable == true else {
            throw CoreError(message: "You lost connection to the internet \n لقد فقدت الاتصال بالإنترنت")
        }
        
        let dataResponse = await makeDataRequest(from: request)
            .validate()
            .serializingDecodable(Request.Response.self)
            .response

        return try APIResponse(
            data: dataResponse.data,
            error: dataResponse.error,
            urlRequest: dataResponse.request,
            urlResponse: dataResponse.response
        )
    }

    private func makeDataRequest<Request: APIRequest>(from request: Request) -> DataRequest {
        let urlRequest = request.urlRequest(for: configuration)

        guard request.multipartFormItems.isNotEmpty else {
            return session.request(urlRequest, interceptor: interceptor)
        }

        return session.upload(
            multipartFormData: { multipartFormData in
                request.multipartFormItems.forEach {
                    multipartFormData.append($0.data, withName: $0.name, fileName: $0.fileName, mimeType: $0.mimeType)
                }
            }, with: urlRequest
            ,interceptor: interceptor
        )
    }
}
