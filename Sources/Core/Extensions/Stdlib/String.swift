//
//  String.swift
//
//
//  Created by Yazan Qaisi on 22/02/2024.
//

import Foundation

public extension String {
    var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var isBlank: Bool {
        trimmed.isEmpty
    }

    var lines: [String] {
        components(separatedBy: "\n")
    }

    var defaultIfEmpty: String {
        isBlank ? "" : self
    }

    var nilIfEmpty: String? {
        isBlank ? nil : self
    }

    var digitsOnly: String {
        components(separatedBy: NSCharacterSet.decimalDigits.inverted).joined(separator: "")
    }
}

//public extension String {
//    var localized: String {
//        localized()
//    }
//
//    func localized(args: CVarArg..., in bundle: Bundle? = nil) -> String {
//        let table = "Localizable"
//        let bundle = bundle ?? .main
//
//        if
//            let path = bundle.path(forResource: Language.current.rawValue, ofType: "lproj"),
//            let bundle = Bundle(path: path)
//        {
//            let format = bundle.localizedString(forKey: self, value: nil, table: table)
//            return String(format: format, arguments: args)
//        } else {
//            return self
//        }
//    }
//}

public extension String {
    func camelCaseToSnakeCase() -> String {
        let acronymPattern = "([A-Z]+)([A-Z][a-z]|[0-9])"
        let normalPattern = "([a-z0-9])([A-Z])"
        return processCamalCaseRegex(pattern: acronymPattern)?
            .processCamalCaseRegex(pattern: normalPattern)?
            .lowercased() ??
            lowercased()
    }

    private func processCamalCaseRegex(pattern: String) -> String? {
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: count)
        return regex?.stringByReplacingMatches(
            in: self,
            options: [],
            range: range,
            withTemplate: "$1_$2"
        )
    }
}

public extension String {
    func isValidEmail() -> Bool {
        let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"
        let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)
        return emailValidationPredicate.evaluate(with: self)
    }
}

public extension String {
    func addComma() -> String {
        guard !self.contains(",") else { return self }
        let number = Double(self) ?? 0
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value: number)) ?? self
        return formattedNumber
    }

    func returnNumberInEnglishFormat() -> String {
        let formatter: NumberFormatter = NumberFormatter()
        formatter.locale = NSLocale(localeIdentifier: "EN") as Locale?
        let final = formatter.number(from: self)
        return final?.stringValue ?? ""
    }

    var isArabic: Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", "(?s).*\\p{Arabic}.*")
        return predicate.evaluate(with: self)
    }
}
