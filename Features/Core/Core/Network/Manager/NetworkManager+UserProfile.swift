//
//  NetworkManager+UserProfile.swift
//  Core
//
//  Created by Kumar, Sumit on 02/10/19.
//  Copyright © 2019 sk. All rights reserved.
//

/// User Profile Network Call Functions
extension NetworkManager {
    
    func fetchUserProfileById(id: String,
                              success: @escaping ((UserProfile) -> Void),
                              failure: @escaping ((Error) -> Void)) {
        let request = FetchUserProfileRequest(baseURL: Constants.Environment.baseURL, id: id)
        //Parsing
        let parseBlock = { (json: [String: Any?]) -> UserProfile? in
            return UserProfile(jsonDictionary: json)
        }
        
        //NetworkManager+UserProfile: Parsing etc and returns back UserProfile along with success/failure closures")
        execute(request: request, parseBlock: parseBlock, success: { (result) in
            print("Response received")
            if let resultValue = result as? [UserProfile], let profile = resultValue.first {
                success(profile)
            } else {
                let error = NSError(domain: "Domain", code: 404, userInfo: nil)
                failure(error)
            }
        }, failure: { (error) in
            failure(error)
        })
        
    }
    
}
