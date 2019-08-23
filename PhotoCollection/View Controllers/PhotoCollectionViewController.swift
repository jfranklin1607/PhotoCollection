//
//  PhotoCollectionViewController.swift
//  PhotoCollection
//
//  Created by Uptiie on 8/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotoCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTheme()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collectionView.reloadData()
        setTheme()
    }

        // Do any additional setup after loading the view.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPhotoSegue" {
            guard let addVC = segue.destination as? AddPhotoViewController else {return}
            addVC.themeHelper = themeHelper
            addVC.photoController = photoController
        } else if segue.identifier == "viewPhotoSegue" {
            guard let viewVC = segue.destination as? AddPhotoViewController else {return}
            viewVC.photoController = photoController
            viewVC.themeHelper = themeHelper
            guard let index = collectionView.indexPathsForSelectedItems?.first else {return}
            viewVC.photo = photoController.photos[index.item]
        } else if segue.identifier == "ThemeSegue" {
            guard let themeVC = segue.destination as? ThemeViewController else {return}
            themeVC.themeHelper = themeHelper
        }
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        
        let selectedPhoto = photoController.photos[indexPath.item]
        cell.photo = selectedPhoto
    
        return cell
    }
    
    func setTheme() {
        guard let theme = themeHelper.themePreference else { return }
        
        if theme == "Dark" {
            collectionView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            
        } else {
            collectionView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        }
    }

}
