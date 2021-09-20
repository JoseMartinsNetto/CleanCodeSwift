//
//  Session.swift
//  CleanCode
//
//  Created by Jose Martins on 21/03/21.
//

import Foundation

class Session: NSObject {
    static func set(_ user: User) {
        
        let defaults = UserDefaults.standard
        
        defaults.setValue(user.login, forKey: "User_login")
        defaults.setValue(user.id, forKey: "User_id")
        defaults.setValue(user.nodeID, forKey: "User_node_id")
        defaults.setValue(user.avatarURL, forKey: "User_avatar_url")
        defaults.setValue(user.gravatarID, forKey: "User_gravatar_id")
        defaults.setValue(user.url, forKey: "User_url")
        defaults.setValue(user.htmlURL, forKey: "User_html_url")
        defaults.setValue(user.followersURL, forKey: "User_followers_url")
        defaults.setValue(user.followingURL, forKey: "User_following_url")
        defaults.setValue(user.gistsURL, forKey: "User_gists_url")
        defaults.setValue(user.starredURL, forKey: "User_starred_url")
        defaults.setValue(user.subscriptionsURL, forKey: "User_subscriptions_url")
        defaults.setValue(user.organizationsURL, forKey: "User_organizations_url")
        defaults.setValue(user.reposURL, forKey: "User_repos_url")
        defaults.setValue(user.eventsURL, forKey: "User_events_url")
        defaults.setValue(user.receivedEventsURL, forKey: "User_received_events_url")
        defaults.setValue(user.type, forKey: "User_type")
        defaults.setValue(user.siteAdmin, forKey: "User_site_admin")
        
        defaults.synchronize()
        
    }
    
    static func get() -> User? {
        
        let defaults = UserDefaults.standard
        
        if let login = defaults.object(forKey: "User_login") as? String, !login.isEmpty {
            
            let id = defaults.object(forKey: "User_id") as? Int
            let node_id = defaults.object(forKey: "User_node_id") as? String
            let avatar_url = defaults.object(forKey: "User_avatar_url") as? String
            let gravatar_id = defaults.object(forKey: "User_gravatar_id") as? String
            let url = defaults.object(forKey: "User_url") as? String
            let html_url = defaults.object(forKey: "User_html_url") as? String
            let followers_url = defaults.object(forKey: "User_followers_url") as? String
            let following_url = defaults.object(forKey: "User_following_url") as? String
            let gists_url = defaults.object(forKey: "User_gists_url") as? String
            let starred_url = defaults.object(forKey: "User_starred_url") as? String
            let subscriptions_url = defaults.object(forKey: "User_subscriptions_url") as? String
            let organizations_url = defaults.object(forKey: "User_organizations_url") as? String
            let repos_url = defaults.object(forKey: "User_repos_url") as? String
            let events_url = defaults.object(forKey: "User_events_url") as? String
            let received_events_url = defaults.object(forKey: "User_received_events_url") as? String
            let type = defaults.object(forKey: "User_type") as? String
            let site_admin = defaults.object(forKey: "User_site_admin") as? Bool
            
            let user = User(
                login: login,
                id: id!,
                nodeID: node_id!,
                avatarURL: avatar_url!,
                gravatarID: gravatar_id!,
                url: url!,
                htmlURL: html_url!,
                followersURL: followers_url!,
                followingURL: following_url!,
                gistsURL: gists_url!,
                starredURL: starred_url!,
                subscriptionsURL: subscriptions_url!,
                organizationsURL: organizations_url!,
                reposURL: repos_url!,
                eventsURL: events_url!,
                receivedEventsURL: received_events_url!,
                type: type!,
                siteAdmin: site_admin!
            )
            
            return user
            
        }
        return nil
    }
    
    static func logout() {
        
        let defaults = UserDefaults.standard
        
        defaults.removeObject(forKey: "User_login")
        defaults.removeObject(forKey: "User_id")
        defaults.removeObject(forKey: "User_node_id")
        defaults.removeObject(forKey: "User_avatar_url")
        defaults.removeObject(forKey: "User_gravatar_id")
        defaults.removeObject(forKey: "User_url")
        defaults.removeObject(forKey: "User_html_url")
        defaults.removeObject(forKey: "User_followers_url")
        defaults.removeObject(forKey: "User_following_url")
        defaults.removeObject(forKey: "User_gists_url")
        defaults.removeObject(forKey: "User_starred_url")
        defaults.removeObject(forKey: "User_subscriptions_url")
        defaults.removeObject(forKey: "User_organizations_url")
        defaults.removeObject(forKey: "User_repos_url")
        defaults.removeObject(forKey: "User_events_url")
        defaults.removeObject(forKey: "User_received_events_url")
        defaults.removeObject(forKey: "User_type")
        defaults.removeObject(forKey: "User_site_admin")
        
        defaults.synchronize()
    }
}
