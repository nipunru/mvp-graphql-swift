//
//  ImageDownloadManager.swift
//  OtriumGithub
//
//  Created by Nipun Ruwanpathirana on 2021-07-02.
//

import UIKit

class ImageDownloadManager {
    
    static let shared = ImageDownloadManager()
        
    func downloadImage(from url: URL,username: String, completion: @escaping (UIImage)->Void) {
        if let cachedImage = CacheManager.shared.getCachedImage(username: username) {
            completion(cachedImage)
        } else {
            getData(from: url) { data, response, error in
                guard let data = data, error == nil else {
                    completion(UIImage(named: "placeholder")!)
                    return
                }
                if let image = UIImage(data: data) {
                    CacheManager.shared.setCachedImage(username: username, image: image)
                    completion(image)
                } else {
                    completion(UIImage(named: "placeholder")!)
                }
            }
        }
    }

    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
