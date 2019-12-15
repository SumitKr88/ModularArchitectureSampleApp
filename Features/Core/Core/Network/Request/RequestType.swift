//
//  RequestType.swift
//  Core
//
//  Created by Kumar, Sumit on 13/10/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Foundation

/// NetworkRequestType defines the different type of request
public enum RequestType {
    
    case userProfile
    case registration
    
    public var urlPath: String {
        switch self {
            
        case .userProfile:
            return "UserProfile"
        case .registration:
            return "Registration"
        }
    }
}
