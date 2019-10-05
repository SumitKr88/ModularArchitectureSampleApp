//
//  NetworkManager+Event.swift
//  Feature1
//
//  Created by Kumar, Sumit on 03/10/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Foundation
import Core

/// Event related Network Call Functions
extension NetworkManager {
    
    func fetchEventById(id: String,
                                  success: @escaping ((Event) -> Void),
                                  failure: @escaping ((Error) -> Void)) {
            print("NetworkManager+Event: Parsing etc and returns back Event along with success/failure closures")
        }
    
}
