//
//  NetworkManager.swift
//  Core
//
//  Created by Kumar, Sumit on 02/10/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Alamofire

/// NetworkManager class for handling all Network related tasks
public class NetworkManager {
    
    /// Shared instance of Network Manager
    static public let shared = NetworkManager()
    
    /**
     Generic Function to execute Network request.
     
     - parameter request: NetworkRequestCreatable request which is to be executed
     - parameter parseBlock: Block to specify to parse destination response object
     - parameter success: If executeRequest() function returns success then response object will be returned back in success block
     - parameter failure: If executeRequest() function returns failure then Error will be returned back in failure block
     */
    public func execute(request: NetworkRequestCreatable, parseBlock: @escaping (([String: Any?]) -> (Any?)),
                        success: @escaping((Any) -> Void), failure: @escaping ((Error) -> ())) {
        
        request.execute(success: {(response) in
            if let parsedResponse = response as? [String: Any?] {
                success(parsedResponse)
            } else {
                success(response)
            }
            
        }, failure: {(error) in
            failure(error)
        })
    }
    
}

