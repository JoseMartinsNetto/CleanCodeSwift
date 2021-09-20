//
//  FollowersManager.swift
//
//  Created by José Martins on 22/03/2021.
//

import Foundation

final class FollowersManager: BaseManager {
    func loadFollowers(gitHubUser: String, completion: @escaping(_ repsonse: [Follower]?, _ error: APIResponseError?) -> Void) {
        let endpoint = Constants
            .API
            .Endpoint
            .Followers
            .replacingOccurrences(of: "{userName}", with: gitHubUser)
        
        request(
            endpoint: endpoint,
            responseType: [Follower].self) { (data: [Follower]?, error: APIResponseError?, code) in
            completion(data, error)
        }
    }
}
