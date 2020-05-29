//
// Created by Ignacio Lee on 2020/5/29.
// Copyright (c) 2020 UltraLCC. All rights reserved.
//

import UIKit
import CoreData

class FavoritePhotoDAO {
    func fetchFavorite() -> [FavoritePhoto]? {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let request: NSFetchRequest<FavoritePhoto> = FavoritePhoto.fetchRequest()
            let context = appDelegate.persistentContainer.viewContext
            do {
                let favoritePhotos = try context.fetch(request)
                return favoritePhotos
            } catch {
                print(error)
            }
        }
        return nil
    }

    func savePhoto(title: String, photoUrl: String, completeFunction: () -> Void){
        var favoritePhoto: FavoritePhoto
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            favoritePhoto = FavoritePhoto(context: appDelegate.persistentContainer.viewContext)
            favoritePhoto.photoUrl = photoUrl
            favoritePhoto.title = title
            print("Saving data to context ...")
            appDelegate.saveContext()
            completeFunction()
        }
    }
}