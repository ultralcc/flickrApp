//
//  PhotoPackage.swift
//  FlickrAPP
//
//  Created by Ignacio Lee on 2020/5/28.
//  Copyright © 2020 UltraLCC. All rights reserved.
//

import Foundation
import XMLMapper

class Photos: XMLMappable {
    var nodeName: String!
    
    var page: String?
    var pages: String?
    var perpage: String?
    var total: String?
    var photoList: [Photo]?
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        page <- map.attributes["photos.page"]
        pages <- map.attributes["photos.pages"]
        perpage <- map.attributes["photos.perpage"]
        total <- map.attributes["photos.total"]
        photoList <- map["photos.photo"]
    }
}
