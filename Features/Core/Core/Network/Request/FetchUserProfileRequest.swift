//
//  FetchUserProfileRequest.swift
//  Core
//
//  Created by Kumar, Sumit on 10/10/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Alamofire

/// Class specifies the main request parameter and body
struct FetchUserProfileRequest {
    
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
    ///   - id: id of the user
    init(baseURL: String,
         id: String?) {
        urlString = baseURL + RequestType.userProfile.urlPath
        self.headers = [Constants.NetworkKeys.contentType: Constants.ContentType.applicationJson]
        
        if let id = id {
            queryParameters[Constants.ApigeeKeys.userId] = id
        }
    }
}

extension FetchUserProfileRequest: NetworkRequestCreatable {
    
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
