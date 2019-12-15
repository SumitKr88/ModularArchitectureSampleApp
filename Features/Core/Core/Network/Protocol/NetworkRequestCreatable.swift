//
//  NetworkRequestCreatable.swift
//  Core
//
//  Created by Kumar, Sumit on 10/10/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Alamofire

/// Delegate for specifying network request details for implementing class
public protocol NetworkRequestCreatable {
    
    // MARK: - Variables
    
    /// URL string to be appended to base URL
    var urlString: String { get }
    
    /// Additional headers to add to the `URLRequest`
    var headers: HTTPHeaders? { get set }
    
    // MARK: - Protocol Functions
    
    /// Initializes the http method to apply to a `URLRequest`.
    ///
    /// - Returns: The adapted `HTTPMethod`.
    func httpMethod() -> HTTPMethod
    
    /// Function for specify additional parameters
    ///
    /// - Returns: Dictionary of parameters to apply to a `URLRequest`
    func parameters() -> Parameters?
    
    /// Function to specify parameter encoding (way in which parameters should be sent in the request)
    ///
    /// - Returns: Type used to define how a set of parameters are applied to a `URLRequest`.
    func parameterEncoding() -> ParameterEncoding
    
    /// Function for executing the Network Request
    ///
    /// - Parameters:
    ///   - success: If success then response object will be returned back in success block
    ///   - failure: If failure then Error will be returned back in failure block
    func execute(success: @escaping((Any) -> Void), failure: @escaping ((Error) -> Void))
}

// MARK: - Protocol Default Implementation
public extension NetworkRequestCreatable {
    
    /// Default definition for parameterEncoding() function
    func parameterEncoding() -> ParameterEncoding {
        return JSONEncoding.default
    }
    
    /// Default definition for parameters() function
    func parameters() -> Parameters? {
        return nil
    }
}
