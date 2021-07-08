//
//  CacheManager.swift
//  OtriumGithub
//
//  Created by Nipun Ruwanpathirana on 2021-07-03.
//

import UIKit

class CacheManager {
    static let shared = CacheManager()
    private let cacheProfile = NSCache<NSString, Profile>()
    private let cacheImage = NSCache<NSString, UIImage>()
    private let expiringCacheDefaultTimeout: TimeInterval = 60*60*24
    
    func getCachedProfile(username: String) -> Profile? {
        return cacheProfile.object(forKey: username as NSString)
    }
    
    func setCachedProfile(username: String, profile: Profile) {
            cacheProfile.setObject(profile, forKey: username as NSString)
            Timer.scheduledTimer(timeInterval: expiringCacheDefaultTimeout, target: self, selector: #selector(timerExpires(sender:)), userInfo: ["username" : username], repeats: false)
    }
    
    @objc private func timerExpires(sender: Timer) {
        if let username = (sender.userInfo as? [String:String])?["username"] {
            cacheProfile.removeObject(forKey: username as NSString)
            cacheImage.removeObject(forKey: username as NSString)
        }
    }
    
    func getCachedImage(username: String) -> UIImage? {
        return cacheImage.object(forKey: username as NSString)
    }
    
    func setCachedImage(username: String, image: UIImage) {
        cacheImage.setObject(image, forKey: username as NSString)
    }
}
