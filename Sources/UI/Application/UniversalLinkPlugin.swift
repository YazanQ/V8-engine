//
//  UniversalLinkPlugin.swift
//
//
//  Created by Yazan Qaisi on 26/05/2024.
//

import Foundation
import Core
import UIKit

public struct UniversalLinkPlugin {
    private let handlers: [UniversalLinkHandler]

    public init(@ArrayBuilder<UniversalLinkHandler> handlers: @escaping () -> [UniversalLinkHandler] = { []} ) {
        self.handlers = handlers()
    }
}

extension UniversalLinkPlugin: ApplicationPlugin {
    public func application(
        _ application: UIApplication,
        continue userActivity: NSUserActivity,
        restorationHandler: @escaping ([any UIUserActivityRestoring]?) -> Void
    ) -> Bool {
        guard
            userActivity.activityType == NSUserActivityTypeBrowsingWeb,
            let url = userActivity.webpageURL else {
            return false
        }
        executeHandler(webUrl: url)
        return true
    }
}

private extension UniversalLinkPlugin {
    func makeUniversalLink(form url: URL) -> UniversalLink {
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        if let queryItems = urlComponents?.queryItems {
            return UniversalLink(queryItems: queryItems)
        } else {
            return UniversalLink(path: urlComponents?.path ?? "")
        }
    }

    func executeHandler(webUrl: URL) {
        let universalLink = makeUniversalLink(form: webUrl)
        let handler = handlers.first { $0.actionType.rawValue == universalLink.actionType?.rawValue }

        do {
            try handler?.handle(link: universalLink)
        } catch {
            handler?.handle(error: error)
        }
    }
}
