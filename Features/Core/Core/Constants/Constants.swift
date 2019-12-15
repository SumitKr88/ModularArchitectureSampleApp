//
//  Constants.swift
//  Core
//
//  Created by Kumar, Sumit on 10/10/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Foundation

/// Constants to be used in the Core specifically.
public struct Constants {
    
    /// Constants for Network/ Response
    public struct NetworkKeys {
        /// networkTimeout defines the timeout network requests creations in seconds
        public static let networkTimeout: Double = 30
        public static let contentType = "Content-Type"
    }
    
    /// Constants for all the Content Types used in code
    public struct ContentType {
        public static let applicationJson = "application/json"
        public static let applicationJsonWithCharsetUTF8 = "application/json; charset=UTF-8"
        public static let applicationFormUrlEncoded = "application/x-www-form-urlencoded"
    }
    
    public struct Environment {
        public static let baseURL = "https://amer-poc7-test.apigee.net/v1/"
    }
    
    /// Constants for all the ApigeeKeys keys used in code
    public struct ApigeeKeys {
        public static let userId = "userId"
        public static let event = "event"
    }
}
