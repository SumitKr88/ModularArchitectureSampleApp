//
//  Feature1ViewController.swift
//  ModularizeApp
//
//  Created by Kumar, Sumit on 03/10/19.
//  Copyright © 2019 sk. All rights reserved.
//

import UIKit
import Feature1

class Feature1ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Using Coremanager to access functions from Core framework into features
        Feature1Manager.shared.fetchEventWithId(id: "12345", success: { (event) in
            print(event.name ?? "")
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
