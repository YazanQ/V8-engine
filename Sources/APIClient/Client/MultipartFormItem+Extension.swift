//
//  MultipartFormItem+Extension.swift
//
//
//  Created by Yazan Qaisi on 24/02/2024.
//

import Core
import Swime

extension MultipartFormItem {
    private var _mimeType: MimeType? {
        Swime.mimeType(data: data)
    }

    var mimeType: String? {
        _mimeType?.mime
    }

    var fileName: String {
        ["file", _mimeType?.ext].compactMap { $0 }.joined(separator: ".")
    }
}
