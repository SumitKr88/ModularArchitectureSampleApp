//
//  NetworkManager+Event.swift
//  Feature1
//
//  Created by Kumar, Sumit on 03/10/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Foundation
import Core

/// Event related Network Call Functions
extension NetworkManager {
    
    func fetchEventById(id: String,
                        success: @escaping ((Event) -> Void),
                        failure: @escaping ((Error) -> Void)) {
        // print("NetworkManager+Event: Parsing etc and returns back Event along with success/failure closures")
        
        let request = FetchEventRequest(baseURL: Constants.Environment.baseURL, id: id)
        //Parsing
        let parseBlock = { (json: [String: Any?]) -> Event? in
            return Event(jsonDictionary: json)
        }
        
        //NetworkManager+UserProfile: Parsing etc and returns back Event along with success/failure closures")
        execute(request: request, parseBlock: parseBlock, success: { (result) in
            print("Response received")
            if let resultValue = result as? [Event], let event = resultValue.first {
                success(event)
            } else {
                let error = NSError(domain: "Domain", code: 404, userInfo: nil)
                failure(error)
            }
        }, failure: { (error) in
            failure(error)
        })
        
    }
    
}
