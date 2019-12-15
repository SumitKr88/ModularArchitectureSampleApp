//
//  FetchEventRequest.swift
//  Feature1
//
//  Created by Kumar, Sumit on 13/10/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Alamofire
import Core

/// Class specifies the main request parameter and body
struct FetchEventRequest {
    
    /// String instance
    let urlString: String
    
    /// HTTPHeaders instance
    var headers: HTTPHeaders?
    
    /// Query paramters to be appended to the url
    private var queryParameters = [String: Any]()
    
    /// Initializer for the request type with provided inputs
    ///
    /// - Parameters:
    ///   - baseURL: String - Base URL of the request
    ///   - id: id of the event
    init(baseURL: String,
         id: String?) {
        urlString = baseURL + RequestType.event.urlPath
        self.headers = [Constants.NetworkKeys.contentType: Constants.ContentType.applicationJson]
        
        if let id = id {
            queryParameters[Constants.ApigeeKeys.event] = id
        }
    }
}

extension FetchEventRequest: NetworkRequestCreatable {
    func httpMethod() -> HTTPMethod {
        return .get
    }
    
    func parameters() -> Parameters? {
        return queryParameters
    }
    
    func parameterEncoding() -> ParameterEncoding {
        return URLEncoding.queryString
    }
    
    func execute(success: @escaping ((Any) -> Void), failure: @escaping ((Error) -> Void)) {
        NetworkRequest.execute(request: self, success: { (response) in
            success(response)
        }, failure: failure)
    }
    
}
