//
//  LoginManager.swift
//
//  Created by José Martins on 22/03/2021.
//

import Foundation

class LoginManager: BaseManager {
    func getUserData(userName: String, completion: @escaping (_ response: User?, _ error: APIResponseError?) -> Void) {
        let endpoint = Constants
            .API
            .Endpoint
            .UserData
            .replacingOccurrences(of: "{userName}", with: userName)
        
        request(
            endpoint: endpoint,
            responseType: User.self,
            errorType: APIResponseError.self) { (data: User?, error: APIResponseError?, code) in
            completion(data, error)
        }
    }
}
