//
//  PhotosViewController.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 26/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

let itemsInRow:CGFloat = 3

class PhotosViewController: BaseViewController {
    
    @IBOutlet weak var collectionView:UICollectionView!

    var photos:[Photo] = [] {
        didSet {
            if collectionView != nil {
                collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupController()
    }
    
    private func setupController() {
        
        navigationItem.title = Constants.Controllers.NavTitle.Photos

    }
    
    override class func storyboardName() -> String {
        // override method for other storyboard names
        return "Photos"
    }

}

extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let availableWidth = view.frame.width
        let widthPerItem = availableWidth / itemsInRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let count = photos.count
        return count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdentifier = "PhotoCell"
        
        let cell:BaseCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! BaseCollectionViewCell
        
        cell.object = photoAt(indexPath: indexPath)
        
        return cell
        
    }
    
    private func photoAt(indexPath:IndexPath) -> Photo {
        return photos[indexPath.row]
    }
    
}
