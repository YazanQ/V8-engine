//
//  Language.swift
//
//
//  Created by Yazan Qaisi on 27/02/2024.
//

import UIKit

public enum Language: String, CaseIterable, Codable {
    case arabic = "ar"
    case english = "en"
}

public extension Language {
    var title: String {
        self == .arabic ? "Arabic" : "English"
    }

    var textAlignment: NSTextAlignment {
        self == .arabic ? .right : .left
    }
}

extension Language {
    @UserDefault(key: "Language")
    public static var current: Language = `default` {
        didSet { appleLanguage = current }
    }

    @UserDefault(key: "AppleLanguages")
    private static var appleLanguage: Language = `default`
    public static var `default`: Language {
        guard
            let preferredLocation = Bundle.main.preferredLocalizations.first,
            Bundle.main.localizations.contains(preferredLocation),
            let language = Language(rawValue: preferredLocation)
        else {
            return .arabic
        }

        return language
    }
}
