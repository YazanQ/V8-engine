//
//  AuthenticationInterceptor.swift
//
//
//  Created by Yazan Qaisi on 25/02/2024.
//

import Foundation
import Alamofire
import Resolver
import Core

public final class AuthenticationInterceptor {
    @Injected private var store: OAuthCredentialStore
    @Injected private var config: APIConfiguration

    private let service: OAuthService
    private let adapter: OAuthHeadersAdapter?
    private let errorHandler: ErrorHandler?

    public init(
        service: OAuthService,
        adapter: OAuthHeadersAdapter?,
        errorHandler: ErrorHandler?
    ) {
        self.service = service
        self.adapter = adapter
        self.errorHandler = errorHandler
    }
}

extension AuthenticationInterceptor: RequestInterceptor {
    public func adapt(
        _ urlRequest: URLRequest,
        for session: Session,
        completion: @escaping (Result<URLRequest, Error>) -> Void
    ) {
        var urlRequest = urlRequest
        if let accessToken = store.credential?.accessToken {
            urlRequest.headers.add(.authorization(bearerToken: accessToken))
        }
        completion(.success(urlRequest))
    }

    public func retry(
        _ request: Alamofire.Request,
        for session: Session,
        dueTo error: Error,
        completion: @escaping (RetryResult) -> Void
    ) {
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
            return completion(.doNotRetryWithError(error))
        }

        guard request.retryCount < config.requestRetryLimit else {
            return completion(.doNotRetry)
        }


    }
}

extension AuthenticationInterceptor {
    private func refresh(completion: @escaping (RetryResult) -> Void) {
        guard let credential = store.credential else {
            let error = CoreError.credential
            DispatchQueue.main.async { [weak self] in self?.errorHandler?.handle(error: error) }
            return completion(.doNotRetryWithError(error))
        }

        Task {
            do {
                let credential = try await service.refresh(with: credential.refreshToken)
                store.credential = credential
                completion(.retry)
            } catch {
                DispatchQueue.main.async { [weak self] in self?.errorHandler?.handle(error: error) }
                completion(.doNotRetryWithError(error))
            }
        }
    }
}

extension CoreError {
    static let credential = CoreError(message: "You are not Authorized!")
}
