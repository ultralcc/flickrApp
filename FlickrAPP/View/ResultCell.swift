//
//  CollectionViewCell.swift
//  FlickrAPP
//
//  Created by Ignacio Lee on 2020/5/28.
//  Copyright © 2020 UltraLCC. All rights reserved.
//

import UIKit
import CoreData

class ResultCell: UICollectionViewCell {
    @IBOutlet var image: CustomImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!

    var photoClickFn: (() -> Void)? = nil
    
    @IBAction func photoClick(_ sender: Any) {
        (photoClickFn ?? { () in print("Photo Click Not Implement!")})()
    }
    
    var cellTag: Int!
    static let width = floor((UIScreen.main.bounds.width - 3 * 1) / 2)
    
    var photo: Photo? {
        didSet{
            setUpImage()
            if photo?.title ?? "" == "" {
                DispatchQueue.main.async() { [weak self] in
                    self?.title.text = "無標題"
                }
            } else {
                DispatchQueue.main.async() { [weak self] in
                    self?.title.text = String(self?.photo!.title ?? "")
                }
            }
        }
    }
    
    func setUpImage(){
        let url = buildImageUrl()
        image.downloaded(from: url)
    }

    func buildImageUrl() -> String {
        let farm = String(photo!.farm ?? "")
        let id = String(photo!.id ?? "")
        let server = String(photo!.server ?? "")
        let secret = String(photo!.secret ?? "")
        return "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        widthConstraint.constant = Self.width
    }
}

