//
//  NetworkRequest.swift
//  Core
//
//  Created by Kumar, Sumit on 10/10/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Alamofire

/// Session for all `URLRequest` in the application.
let alamofireSession: Session = {
    
    // Background session
    let configuration = URLSessionConfiguration.default
    
    // Turn-off caching
    configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
    configuration.urlCache = nil
    
    // Request Time-out
    configuration.timeoutIntervalForRequest = Constants.NetworkKeys.networkTimeout
    configuration.timeoutIntervalForResource = Constants.NetworkKeys.networkTimeout
    
    // Set service type
    configuration.networkServiceType = .responsiveData
    
    // Create session
    let session = Alamofire.Session(configuration: configuration)
    return session
}()

public final class NetworkRequest {
    
    /// Creates network request in the default session and enqueues it for execution.
    ///
    /// - Parameters:
    ///   - request: Struct specifying parameters required to configure `URLRequest`.
    ///   - success: If result returns the success then response object will be returned back in success block
    ///   - failure: If result returns the failure then Error will be returned back in failure block
    public static func execute(request: NetworkRequestCreatable, success: @escaping((Any) -> Void), failure: @escaping ((Error) -> Void)) {
        
        let networkRequest = alamofireSession.request(request.urlString,
                                                      method: request.httpMethod(),
                                                      parameters: request.parameters(),
                                                      encoding: request.parameterEncoding(),
                                                      headers: request.headers)
        
        executeRequest(request: networkRequest, success: { (value) in
            success(value)
        }, failure: failure)
    }
    
    /// Executes the network request in the default session
    /// - Parameter request: DataRequest object defined in alamofire
    /// - Parameter success: If result returns the success then response object will be returned back in success block
    /// - Parameter failure: If result returns the failure then Error will be returned back in failure block
    static func executeRequest(request: DataRequest, success: @escaping((Any) -> Void), failure: @escaping ((Error) -> ())) {
        
        request.validate(statusCode: 200..<400)
        request.responseJSON(options: JSONSerialization.ReadingOptions.allowFragments) { (response) in
            
            switch response.result {
            case .success(let value):
                if let statusCode = response.response?.statusCode,
                    (statusCode > 199) && (statusCode < 301) {
                    if let data = response.data  {
                        print("In success block")
                        success(data)
                    } else {
                        success(value)
                    }
                } else {
                    print("In failure block")
                    //failure(errorcode)
                }
                break
                
            case .failure(let error):
                print("In failure block")
                if let statusCode = response.response?.statusCode {
                    print("Error status code: \(statusCode) ")
                    //As per statusCode, define error message etc to be send back to client as response
                } else {
                    print("In failure block")
                    print(error.localizedDescription)
                    failure(error)
                    //Define error message etc to be send back to client as response
                }
            }
        }
    }
}
