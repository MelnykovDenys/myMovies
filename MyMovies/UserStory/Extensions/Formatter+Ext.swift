//
//  Formatter+Ext.swift
//  MyMovies
//
//  Created by Mac on 03.12.2020.
//

import Foundation

extension Formatter {
    static let currency = NumberFormatter(style: .currency)
}

extension NumberFormatter {
    convenience init(style: Style, locale: Locale = .us) {
        self.init()
        self.locale = locale
        numberStyle = style
    }
}

extension Numeric {
    var currency: String { Formatter.currency.string(for: self) ?? "" }
}

extension Locale {
    static let us = Locale(identifier: "en_US")
}
