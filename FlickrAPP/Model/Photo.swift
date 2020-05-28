//
//  PhotoData.swift
//  FlickrAPP
//
//  Created by Ignacio Lee on 2020/5/28.
//  Copyright © 2020 UltraLCC. All rights reserved.
//

import Foundation
import XMLMapper

class Photo: XMLMappable {
    var nodeName: String!
    
    var id: String?
    var owner: String?
    var secret: String?
    var server: String?
    var farm: String?
    var title: String?
    var ispublic: String?
    var isfriend: String?
    var isfamily: String?
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        id <- map.attributes["id"]
        owner <- map.attributes["owner"]
        secret <- map.attributes["secret"]
        server <- map.attributes["server"]
        farm <- map.attributes["farm"]
        title <- map.attributes["title"]
        ispublic <- map.attributes["ispublic"]
        isfriend <- map.attributes["isfriend"]
        isfamily <- map.attributes["isfamily"]
    }
}
