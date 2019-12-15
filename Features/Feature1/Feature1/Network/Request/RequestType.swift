//
//  RequestType.swift
//  Feature1
//
//  Created by Kumar, Sumit on 13/10/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Foundation

/// NetworkRequestType defines the different type of request
public enum RequestType {
    
    case event
    case eventSearch
    
    public var urlPath: String {
        switch self {
            
        case .event:
            return "event"
        case .eventSearch:
            return "eventSearch"
        }
    }
}
