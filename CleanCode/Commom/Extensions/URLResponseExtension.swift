//
//  URLResponseExtension.swift
//  CleanCode
//
//  Created by Jose Martins on 22/03/21.
//

import Foundation

extension URLResponse {
    
    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        
        return nil
    }
}
