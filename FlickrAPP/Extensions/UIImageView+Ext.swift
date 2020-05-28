//
//  UIImageView+Ext.swift
//  FlickrAPP
//
//  Created by Ignacio Lee on 2020/5/28.
//  Copyright © 2020 UltraLCC. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill, link: String) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        imageUrlString = link
        contentMode = mode
        if let imageFromCache = imageCache.object(forKey: link as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let imageToCache = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                if self?.imageUrlString == link {
                    self?.image = imageToCache
                }
                imageCache.setObject(imageToCache as AnyObject, forKey: link as AnyObject)
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFill) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        imageUrlString = link
        image = nil
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode,link: link)
    }
}
