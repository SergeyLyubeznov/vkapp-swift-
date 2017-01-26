//
//  ImageManager.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 26/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import SDWebImage

class ImageManager: NSObject {

    class func loadImageAt(url:URL,completion:@escaping (_ image: UIImage?) -> Void) {
        
        let downloader = SDWebImageDownloader.shared()
        
        DispatchQueue.global(qos: .background).async {
            
            downloader?.downloadImage(with: url, options:SDWebImageDownloaderOptions.useNSURLCache,
                                      progress: nil, completed: { (image, data, error, result) in
                                        
                                        DispatchQueue.main.async {
                                            if image != nil {
                                                completion(image)
                                            }
                                        }
            })
            
        }
        
        
    }
    
}
