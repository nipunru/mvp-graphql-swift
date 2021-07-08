//
//  ProfilePresenter.swift
//  OtriumGithub
//
//  Created by Nipun Ruwanpathirana on 2021-07-02.
//

import UIKit

typealias ProfileDelegate = ProfilePresenterDelegate & UIViewController

protocol ProfilePresenterDelegate: Any {
    func presentProfile(profile: Profile)
}

class ProfilePresenter {
    
    weak var delegate: ProfileDelegate?
    
    public func setViewDelegate(delegate: ProfileDelegate) {
        self.delegate = delegate
    }
    
    public func fetchProfile(username: String) {
        if let profile = CacheManager.shared.getCachedProfile(username: username) {
            Logger.log(.info, data: "Loading from cache: \(username)")
            self.delegate?.presentProfile(profile: profile)
        } else {
            Service.shared.apollo.fetch(query: GetProfileDetailsQuery(username: username)) { result in
                switch result {
                case .success(let response):
                    if response.data != nil && response.data!.user != nil {
                        let profile = Profile(user: response.data!.user!)
                        CacheManager.shared.setCachedProfile(username: profile.login ?? username, profile: profile)
                        self.delegate?.presentProfile(profile: profile)
                    } else {
                        //Haven't show the error in the UI since not required.
                        Logger.log(.error, data: "Something went wrong!")
                    }
                case .failure(let error):
                    //Haven't show the error in the UI since not required.
                    Logger.log(.error, data: error)
                }
                
            }
        }
    }
    
}
