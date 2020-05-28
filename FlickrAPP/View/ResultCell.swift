//
//  CollectionViewCell.swift
//  FlickrAPP
//
//  Created by Ignacio Lee on 2020/5/28.
//  Copyright © 2020 UltraLCC. All rights reserved.
//

import UIKit

class ResultCell: UICollectionViewCell {
    @IBOutlet var image: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    static let width = floor((UIScreen.main.bounds.width - 3 * 1) / 2)
    override func awakeFromNib() {
        super.awakeFromNib()
        widthConstraint.constant = Self.width
    }
}

