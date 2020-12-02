//
//  MoviesTabBarController.swift
//  MyMovies
//
//  Created by Mac on 02.12.2020.
//

import Foundation
import UIKit

enum TabItem: Int, CaseIterable {
    case list
    case favorites
    
    var title: String {
        switch self {
        
        case .list:
            <#code#>
        case .favorites:
            <#code#>
        }
    }
    
    var image: UIImage? {
        switch self {
        
        case .list:
            <#code#>
        case .favorites:
            <#code#>
        }
    }
    
    var scene: UIViewController.Type {
        switch self {
        
        case .list:
            <#code#>
        case .favorites:
            <#code#>
        }
    }
}

extension UITabBarItem {
    fileprivate convenience init(item: TabItem) {
        self.init(title: item.title, image: item.image, selectedImage: nil)
    }
}
