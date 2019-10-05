//
//  NetworkManager+UserProfile.swift
//  Core
//
//  Created by Kumar, Sumit on 02/10/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Foundation

/// User Profile Network Call Functions
extension NetworkManager {
    
    func fetchUserProfileById(id: String,
                              success: @escaping ((UserProfile) -> Void),
                              failure: @escaping ((Error) -> Void)) {
        print("NetworkManager+UserProfile: Parsing etc and returns back UserProfile along with success/failure closures")
    }
    
}
