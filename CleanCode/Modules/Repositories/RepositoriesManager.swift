//
//  ReposManager.swift
//
//  Created by José Martins on 24/03/2021.
//

import Foundation

final class RepositoriesManager: BaseManager {
    func loadData(gitHubUser: String, completion: @escaping (_ response: [Repository]?, _ error: APIResponseError?) -> Void) {
        let endpoint = Constants.API.Endpoint.Repos.replacingOccurrences(of: "{userName}", with: gitHubUser)
        
        request(
            endpoint: endpoint,
            type: .get,
            responseType: [Repository].self)
        { (data: [Repository]?, error: APIResponseError?, code) in
            completion(data, error)
        }
    }
}
