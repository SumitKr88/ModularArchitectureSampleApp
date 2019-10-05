//
//  CoreManager.swift
//  Core
//
//  Created by Kumar, Sumit on 02/10/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Foundation

/// Single point of access to the application to utilize the functions of Core Manager
open class CoreManager {
    
    /// A static shared instance of 'CoreManager'
    public static let shared = CoreManager()
    
    /// Instance of Network Manager
    private let networkManager: NetworkManager
    
    /// Initialisation for core manager
    ///
    /// - Parameters:
    /// - networkManager: network manager instance
    init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
    }
}

// MARK:
extension CoreManager {
    
    public func fetchUserInfo(id: String,
                              success: @escaping ((UserProfile) -> Void),
                              failure: @escaping ((Error) -> Void)) {
        
        print("CoreManager: Calling function..")
        networkManager.fetchUserProfileById(id: id,
                                            success: success,
                                            failure: failure)
        print("CoreManager: Return/save UserProfile along with success/failure closures")
    }
}
