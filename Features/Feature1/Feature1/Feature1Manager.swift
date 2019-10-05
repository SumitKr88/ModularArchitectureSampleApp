//
//  Feature1Manager.swift
//  Feature1
//
//  Created by Kumar, Sumit on 03/10/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Foundation
import Core

/// Single point of contact for all network request in Feature1
public class Feature1Manager {
    
    // MARK: - Properties
    
    /// Shared instance of 'Feature1Manager'
    public static let shared = Feature1Manager()
    
    /// Indicates the shared instance of NetworkManager
    private let networkManager = NetworkManager.shared

    // MARK: - Initializer
    public init() {}
}

extension Feature1Manager {
    
    public func fetchEventWithId(id: String,
                          success: @escaping ((Event) -> Void),
                          failure: @escaping ((Error) -> Void)) {
        
     print("Feature1Manager: Calling function..")
     networkManager.fetchEventById(id: id,
                                   success: success,
                                   failure: failure)
     print("Feature1: Return/save UserProfile along with success/failure closures")
    
    }
                          
}
