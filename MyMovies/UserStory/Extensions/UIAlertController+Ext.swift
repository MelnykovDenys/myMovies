//
//  UIAlertController+Ext.swift
//  MyMovies
//
//  Created by Mac on 03.12.2020.
//

import Foundation
import UIKit

extension UIAlertController {
    
    static func confirmationAlert(title: String?,
                                  message: String?,
                                  cancelHandler: ((UIAlertAction) -> Void)? = nil,
                                  confirmHandler: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "No".localized, style: .cancel, handler: cancelHandler)
        let okAction = UIAlertAction(title: "Yes".localized, style: .default, handler: confirmHandler)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        return alert
    }
    
    static func errorAlert(with message: String? = nil) -> UIAlertController {
        let alert = UIAlertController(title: "Error".localized,
                                      message: message ?? "Sorry, server is not available now, please try again later".localized,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok".localized, style: .default, handler: nil)
        alert.addAction(okAction)
        
        return alert
    }
}

