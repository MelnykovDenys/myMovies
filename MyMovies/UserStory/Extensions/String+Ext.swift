//
//  String+Ext.swift
//  MyMovies
//
//  Created by Mac on 03.12.2020.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
