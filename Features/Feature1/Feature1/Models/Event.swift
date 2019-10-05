//
//  Event.swift
//  Feature1
//
//  Created by Kumar, Sumit on 03/10/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Foundation

public class Event: NSObject {
    public var name: String?
    public var location: String?
    
    // MARK: - Initializers
    required public convenience init?(jsonDictionary: [String: Any?]) {
        self.init()
        guard let name = jsonDictionary["name"] as? String, let location = jsonDictionary["location"] as? String else { return nil }
        
        self.name = name
        self.location = location
    }
}
