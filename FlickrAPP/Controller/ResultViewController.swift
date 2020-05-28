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
    var photoCache = [Int: UIImage]()
    
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
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ResultCell.self)", for: indexPath) as! ResultCell
            cell.photo = photoList[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "loadingCell", for: indexPath) as! LoadingCell
            cell.activityIndicator.startAnimating()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.section == 1 && !isLoading {
            isLoading = true
            self.loadPhotos()
        }
    }
    
    
    // MARK: - Functions
    func loadPhotos() {
        PhotoService.getPhotos(page: String(nowPage), per_page: limit, text: search) { (photos) in
            self.nowPage = Int(photos!.page ?? "1")! + 1
            self.photoList.append(contentsOf: photos!.photoList ?? [])
            self.resultCollectionView.reloadSections([0])
            self.isLoading = false
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
