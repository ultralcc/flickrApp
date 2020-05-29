//
//  FavoritePhotoViewController.swift
//  FlickrAPP
//
//  Created by Ignacio Lee on 2020/5/29.
//  Copyright © 2020 UltraLCC. All rights reserved.
//

import UIKit

class FavoritePhotoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var favoriteCollectionView: UICollectionView!
    var favoritePhotos: [FavoritePhoto]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        favoritePhotos?.count ?? 0
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as! FavoriteCell
        cell.favoritePhoto = favoritePhotos?[indexPath.row]
        return cell

    }

    // MARK: - Functions

    func loadData() {
        favoritePhotos = FavoritePhotoDAO().fetchFavorite()
        favoriteCollectionView.reloadData()
    }

}
