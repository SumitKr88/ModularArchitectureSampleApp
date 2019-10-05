//
//  UserProfile.swift
//  Core
//
//  Created by Kumar, Sumit on 03/10/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Foundation

public class UserProfile: NSObject {
    public var email: String?
    public var username: String?
    
    // MARK: - Initializers
    required public convenience init?(jsonDictionary: [String: Any?]) {
        self.init()
        guard let email = jsonDictionary["email"] as? String, let username = jsonDictionary["username"] as? String else { return nil }
        
        self.email = email
        self.username = username
    }
}
