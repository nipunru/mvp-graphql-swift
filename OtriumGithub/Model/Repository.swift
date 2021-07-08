//
//  Repository.swift
//  OtriumGithub
//
//  Created by Nipun Ruwanpathirana on 2021-07-02.
//

import Foundation

struct Repository {
    let id: String
    let name: String
    let stars: Int
    let description: String
    let primaryLanguage: String
    
    init(pinnedItem: GetProfileDetailsQuery.Data.User.PinnedItem.Node) {
        self.id = pinnedItem.resultMap["id"] as? String ?? ""
        self.name = pinnedItem.resultMap["name"] as? String ?? ""
        self.stars = pinnedItem.resultMap["stargazerCount"] as? Int ?? 0
        self.description = pinnedItem.resultMap["description"] as? String ?? ""
        self.primaryLanguage = (pinnedItem.resultMap["primaryLanguage"] as? [String: String])?["name"] ?? ""
    }
    
    init(topItem: GetProfileDetailsQuery.Data.User.TopRepository.Node) {
        self.id = topItem.resultMap["id"] as? String ?? ""
        self.name = topItem.resultMap["name"] as? String ?? ""
        self.stars = topItem.resultMap["stargazerCount"]  as? Int ?? 0
        self.description = topItem.resultMap["description"] as? String ?? ""
        self.primaryLanguage = (topItem.resultMap["primaryLanguage"] as? [String: String])?["name"] ?? ""
    }
    
    init(starItem: GetProfileDetailsQuery.Data.User.Repository.Node) {
        self.id = starItem.resultMap["id"] as? String ?? ""
        self.name = starItem.resultMap["name"] as? String ?? ""
        self.stars = starItem.resultMap["stargazerCount"] as? Int ?? 0
        self.description = starItem.resultMap["description"] as? String ?? ""
        self.primaryLanguage = (starItem.resultMap["primaryLanguage"] as? [String: String])?["name"] ?? ""
    }
}
