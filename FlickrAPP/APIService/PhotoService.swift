//
//  PhotoService.swift
//  FlickrAPP
//
//  Created by Ignacio Lee on 2020/5/28.
//  Copyright © 2020 UltraLCC. All rights reserved.
//

import UIKit
import Alamofire

class PhotoService {
    
    // MARK: - Order
    static func getPhotos(page: String, per_page: String, text: String, completeFunction: @escaping (_ resData: Photos?) -> Void){
        let method = "flickr.photos.search"
        let apiKey = "65905286c8cfb7576c49d2823de7b581"
        let urlString = "https://api.flickr.com/services/rest?method=\(method)&api_key=\(apiKey)&page=\(page)&per_page=\(per_page)&text=\(text)"

        if let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),let url = URL(string: encoded)
        {
            AF.request(url, method: .get, encoding: JSONEncoding.default)
                .validate(statusCode: 200..<299)
                .responseString { response in
                    switch response.result {
                        case let .success(xml):
                            let photos = Photos(XMLString: xml)
                            completeFunction(photos)
                        case let .failure(error):
                            print(error)
                    }
            }
        }
    
        
    }
}
