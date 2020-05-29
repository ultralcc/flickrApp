//
//  ResultViewController.swift
//  FlickrAPP
//
//  Created by Ignacio Lee on 2020/5/28.
//  Copyright © 2020 UltraLCC. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var resultCollectionView: UICollectionView!
    
    var search: String!
    var limit: String!
    var nowPage = 1
    var photoList: [Photo] = []
    var isLoading = true
    var isLast = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPhotos()
        
    }
    
    
    // MARK: - Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return photoList.count
        } else {
            return 1
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 && !isLoading && !isLast{
            isLoading = true
            self.loadPhotos()
        }
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ResultCell.self)", for: indexPath) as! ResultCell
            cell.photo = photoList[indexPath.row]
            cell.photoClickFn = { () in
                let favoritePhotos = FavoritePhotoDAO().fetchFavorite()
                if favoritePhotos?.contains(where: { (favoritePhoto) in favoritePhoto.photoUrl == cell.buildImageUrl()}) ?? false {
                    self.showAlert(title: "等等...", message: "這個照片已經加入喜愛清單")
                    return
                }
                FavoritePhotoDAO().savePhoto(title: cell.photo?.title ?? "", photoUrl: cell.buildImageUrl()){ () in
                    self.showAlert(title: "太好了！", message: "加入喜愛清單成功")
                }
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "loadingCell", for: indexPath) as! LoadingCell
            if !isLast {
                cell.activityIndicator.startAnimating()
            } else {
                cell.activityIndicator.removeFromSuperview()
            }
            return cell
        }
    }
    
    // MARK: - Functions
    func loadPhotos() {
        PhotoService.getPhotos(page: String(nowPage), per_page: limit, text: search) { (photos) in
            if photos?.photoList?.count ?? 0 < Int(self.limit)! {
                self.isLast = true
            }
            self.nowPage = Int(photos!.page ?? "1")! + 1
            self.photoList.append(contentsOf: photos!.photoList ?? [])
            
            if #available(iOS 13.0, *) {
                self.resultCollectionView.reloadSections([0])
            } else {
                UIView.performWithoutAnimation {
                    let loc = self.resultCollectionView.contentOffset
                    self.resultCollectionView.reloadSections([0])
                    self.resultCollectionView.contentOffset = loc
                }
            }
            if self.nowPage == 2{
                self.resultCollectionView.reloadSections([1])
            }
            
            let seconds = 0.5
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                self.isLoading = false
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
