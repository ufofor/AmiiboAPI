//
//  CustomImageView.swift
//  CollectionViewAPI
//
//  Created by Sean Kang on 2020/10/29.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    
    var task: URLSessionTask!
    
    let spinner = UIActivityIndicatorView(style: .gray)
    
    func loadImage(from url:URL) {
        image = nil
        
        addSpiner()
        
        if let task = task {
        task.cancel()
        }
        
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        task = URLSession.shared.dataTask(with: url) { (data,response,error) in
            
            guard let data = data, let newImage = UIImage(data: data) else {
                print("Failed to load")
                return
            }
            
            imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)
            
            DispatchQueue.main.async {
                self.image = newImage
            }
            
        }
        task.resume()
    }
    
    func addSpiner() {
        addSubview(spinner)
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        spinner.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        spinner.startAnimating()
    }
}
