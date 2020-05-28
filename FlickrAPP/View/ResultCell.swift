//
//  CollectionViewCell.swift
//  FlickrAPP
//
//  Created by Ignacio Lee on 2020/5/28.
//  Copyright © 2020 UltraLCC. All rights reserved.
//

import UIKit

class ResultCell: UICollectionViewCell {
    @IBOutlet var image: CustomImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    var cellTag: Int!
    static let width = floor((UIScreen.main.bounds.width - 3 * 1) / 2)
    
    var photo: Photo? {
        didSet{
            let farm = String(photo!.farm ?? "")
            let id = String(photo!.id ?? "")
            let server = String(photo!.server ?? "")
            let secret = String(photo!.secret ?? "")
            setUpImage(farm: farm, id: id, server: server, secret: secret)
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
    
    func setUpImage(farm: String, id: String, server: String, secret: String){
        let url = "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg"
        image.downloaded(from: url)
    }
    
//    func setUpImage(farm: String, id: String, server: String, secret: String){
//        guard let url = URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg") else { return }
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if error != nil {
//                print(error ?? "")
//            }
//
//            DispatchQueue.main.async() { [weak self] in
//                self?.image.image = UIImage(data: data!)
//            }
//
//        }.resume()
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        widthConstraint.constant = Self.width
    }
}

