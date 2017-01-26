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
    
    var startIndex:Int = 0

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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if startIndex > 0 {
            view.layoutIfNeeded()
            
            let indexPath = IndexPath(row: startIndex, section: 0)
            collectionView.scrollToItem(at:indexPath, at: .centeredVertically, animated: false)
        }
    }
    
    private func setupController() {
        
        navigationItem.title = Constants.Controllers.NavTitle.Photos

    }
    
    override class func storyboardName() -> String {
        // override method for other storyboard names
        return "Photos"
    }

}

extension PhotosViewController: Observer {
    
    func objectDidChange(object:AnyObject) {
        guard let photo = object as? Photo else {
            return
        }
        photo.removeAllObservers()
        showPhotosGalleryAt(startIndex: startIndex)
        startIndex = 0
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
        
        let object = photoAt(indexPath: indexPath)
        
        if startIndex > 0 && startIndex == indexPath.row {
            let observerObject = ObserverObject()
            
            weak var this = self
            
            observerObject.object = this
            object.addObserver(observer: observerObject)
        }
        
        cell.object = photoAt(indexPath: indexPath)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        showPhotosGalleryAt(startIndex: indexPath.row)
    }
    
    internal func showPhotosGalleryAt(startIndex:Int) {
        let photosGallery = PhotosGallery()
        photosGallery.photos = photos
        photosGallery.startIdex = startIndex
        self.presentImageGallery(photosGallery.controller!)
    }
    
    private func photoAt(indexPath:IndexPath) -> Photo {
        return photos[indexPath.row]
    }
    
}
