//
//  ImageLoader.swift
//  MyMovies
//
//  Created by Mac on 02.12.2020.
//

import Foundation
import UIKit

class ImageLoader {
    
    static let shared = ImageLoader()
    
    private var task: URLSessionDownloadTask?
    private var session = URLSession.shared
    private var cache: NSCache<NSString, UIImage> = NSCache()
    
    func obtainImageWithPath(imagePath: String, completionHandler: @escaping (UIImage) -> ()) {
        let imageApi = Constants.imageURL + imagePath
        if let image = self.cache.object(forKey: imageApi as NSString) {
            DispatchQueue.main.async {
                completionHandler(image)
            }
        } else {
            let placeholder = UIImage(named: "emptyPoster") ?? UIImage()
            DispatchQueue.main.async {
                completionHandler(placeholder)
            }
            let url: URL! = URL(string: imageApi)
            task = session.downloadTask(with: url, completionHandler: { (location, response, error) in
                if let data = try? Data(contentsOf: url) {
                    let img: UIImage! = UIImage(data: data)
                    self.cache.setObject(img, forKey: imageApi as NSString)
                    DispatchQueue.main.async {
                        completionHandler(img)
                    }
                }
            })
            task?.resume()
        }
    }
}

