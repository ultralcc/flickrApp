//
// Created by Ignacio Lee on 2020/5/29.
// Copyright (c) 2020 UltraLCC. All rights reserved.
//

import UIKit

class FavoriteCell: UICollectionViewCell{
    
    @IBOutlet var title: UILabel!
    @IBOutlet var photoImage: CustomImageView!
    @IBOutlet var widthConstraint: NSLayoutConstraint!

    var cellTag: Int!
    static let width = floor((UIScreen.main.bounds.width - 3 * 1) / 2)

    var favoritePhoto: FavoritePhoto? {
        didSet{
            setUpImage(url: favoritePhoto?.photoUrl ?? "")
            if favoritePhoto?.title ?? "" == "" {
                DispatchQueue.main.async() { [weak self] in
                    self?.title.text = "無標題"
                }
            } else {
                DispatchQueue.main.async() { [weak self] in
                    self?.title.text = String(self?.favoritePhoto!.title ?? "")
                }
            }
        }
    }

    func setUpImage(url: String){
        photoImage.downloaded(from: url)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        widthConstraint.constant = Self.width
    }
}
