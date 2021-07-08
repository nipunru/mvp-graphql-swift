//
//  Profile.swift
//  OtriumGithub
//
//  Created by Nipun Ruwanpathirana on 2021-07-02.
//

import Foundation

class Profile {
    let id: String
    let name: String?
    let login: String?
    let email: String?
    let avatarUrl: String?
    let followerCount: Int
    let followinCount: Int
    var pinnedRepos: [Repository] =  [Repository]()
    var topRepos: [Repository] =  [Repository]()
    var starRepos: [Repository] =  [Repository]()
    
    init(user: GetProfileDetailsQuery.Data.User) {
        self.id = user.id
        self.name = user.name
        self.login = user.login
        self.email = user.email
        self.avatarUrl = user.avatarUrl
        self.followerCount = user.followers.totalCount
        self.followinCount = user.following.totalCount
        
        user.pinnedItems.nodes?.forEach({ item in
            guard item != nil else { return }
            self.pinnedRepos.append(Repository(pinnedItem: item!))
        })
        
        user.topRepositories.nodes?.forEach({ item in
            guard item != nil else { return }
            self.topRepos.append(Repository(topItem: item!))
        })
        
        user.repositories.nodes?.forEach({ item in
            guard item != nil else { return }
            self.starRepos.append(Repository(starItem: item!))
        })
    }
}
