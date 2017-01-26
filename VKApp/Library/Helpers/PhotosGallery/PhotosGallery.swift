//
//  PhotosGallery.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 26/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import ImageViewer

class PhotosGallery: GalleryItemsDatasource {
    
    var startIdex:Int = 0
    
    var photos:[Photo] = []
    
    var controller:GalleryViewController? {
            get {
                
                let galleryViewController = GalleryViewController.init(startIndex: startIdex, itemsDatasource: self, displacedViewsDatasource: nil, configuration: galleryConfiguration())
                
                let frame = CGRect(x: 0, y: 0, width: 200, height: 24)
                //let headerView = CounterView(frame: frame, currentIndex: startIdex, count: photos.count)
                let footerView = CounterView(frame: frame, currentIndex: startIdex, count: photos.count)
               // galleryViewController.headerView = headerView
                galleryViewController.footerView = footerView
                galleryViewController.launchedCompletion = { print("LAUNCHED") }
                galleryViewController.closedCompletion = { print("CLOSED") }
                galleryViewController.swipedToDismissCompletion = { print("SWIPE-DISMISSED") }
                
                galleryViewController.landedPageAtIndexCompletion = { index in
                    
                    print("LANDED AT INDEX: \(index)")
                    
                   // headerView.count = self.photos.count
                   // headerView.currentIndex = index
                    footerView.count = self.photos.count
                    footerView.currentIndex = index
                }
                
                
                return galleryViewController
            }
    }
    
    
    func itemCount() -> Int {
        return photos.count
    }
    func provideGalleryItem(_ index: Int) -> GalleryItem {
        
        let photo = photos[index]
        var galleryItem: GalleryItem!
        
        
        if photo.image != nil {
            galleryItem = GalleryItem.image{($0(photo.image))}
            
        } else {
            galleryItem = GalleryItem.image(fetchImageBlock: { (image) in
                ImageManager.loadImageAt(url: URL(string:photo.original!)!,
                                         completion: { (imageOriginal) in
                                            image(imageOriginal)
                })
            })
        }
        
        return galleryItem
    }
    
    func galleryConfiguration() -> GalleryConfiguration {
        
        let button = UIButton.init(frame: CGRect(x:0,y:0,width:80,height:50))
            //button.backgroundColor = UIColor.orange
            button.setTitle("Закрыть", for: .normal)
        
        return [
            
            GalleryConfigurationItem.closeButtonMode(.custom(button)),
            GalleryConfigurationItem.thumbnailsButtonMode(.none),
            
            GalleryConfigurationItem.pagingMode(.standard),
            GalleryConfigurationItem.presentationStyle(.displacement),
            GalleryConfigurationItem.hideDecorationViewsOnLaunch(false),
            
            GalleryConfigurationItem.overlayColor(UIColor(white: 0.035, alpha: 1)),
            GalleryConfigurationItem.overlayColorOpacity(1),
            GalleryConfigurationItem.overlayBlurOpacity(1),
            GalleryConfigurationItem.overlayBlurStyle(UIBlurEffectStyle.light),
            
            GalleryConfigurationItem.maximumZoolScale(8),
            GalleryConfigurationItem.swipeToDismissThresholdVelocity(500),
            
            GalleryConfigurationItem.doubleTapToZoomDuration(0.15),
            
            GalleryConfigurationItem.blurPresentDuration(0.5),
            GalleryConfigurationItem.blurPresentDelay(0),
            GalleryConfigurationItem.colorPresentDuration(0.25),
            GalleryConfigurationItem.colorPresentDelay(0),
            
            GalleryConfigurationItem.blurDismissDuration(0.1),
            GalleryConfigurationItem.blurDismissDelay(0.4),
            GalleryConfigurationItem.colorDismissDuration(0.45),
            GalleryConfigurationItem.colorDismissDelay(0),
            
            GalleryConfigurationItem.itemFadeDuration(0.3),
            GalleryConfigurationItem.decorationViewsFadeDuration(0.15),
            GalleryConfigurationItem.rotationDuration(0.15),
            
            GalleryConfigurationItem.displacementDuration(0.55),
            GalleryConfigurationItem.reverseDisplacementDuration(0.25),
            GalleryConfigurationItem.displacementTransitionStyle(.springBounce(0.7)),
            GalleryConfigurationItem.displacementTimingCurve(.linear),
            
            GalleryConfigurationItem.statusBarHidden(true),
            GalleryConfigurationItem.displacementKeepOriginalInPlace(false),
            GalleryConfigurationItem.displacementInsetMargin(50)
        ]
    }

}
