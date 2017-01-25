//
//  ProfilePhotosCell.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 25/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class ProfilePhotosCell: BaseTableViewCell {

    @IBOutlet weak var collectionView:UICollectionView!
    
    internal var photos:[Photo] = [Photo]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if collectionView != nil {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    override func updateUI() {
        
        guard let user = object as? User else {
            return
        }
        
        photos = user.photos
        collectionView.reloadData()
    }

}

extension ProfilePhotosCell:UICollectionViewDelegate, UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let count = photos.count
        return count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdentifier = "ProfilePhotoCell"
        
        let cell:BaseCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! BaseCollectionViewCell
        
        cell.object = itemAt(indexPath: indexPath)
        
        return cell
        
    }

    private func itemAt(indexPath:IndexPath) -> Photo {
        return photos[indexPath.row]
    }

}
