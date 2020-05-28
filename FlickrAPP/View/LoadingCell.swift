//
//  LoadingCell.swift
//  FlickrAPP
//
//  Created by Ignacio Lee on 2020/5/29.
//  Copyright © 2020 UltraLCC. All rights reserved.
//

import UIKit

class LoadingCell: UICollectionViewCell {
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var widthConstraint: NSLayoutConstraint!
    
    static let width = floor(UIScreen.main.bounds.width)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        widthConstraint.constant = Self.width
    }
}
