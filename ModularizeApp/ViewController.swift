//
//  ViewController.swift
//  ModularizeApp
//
//  Created by Kumar, Sumit on 28/09/19.
//  Copyright © 2019 sk. All rights reserved.
//

import UIKit
import Core
import UI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /// Using Coremanager to access functions from Core framework into features
        CoreManager.shared.fetchUserInfo(id: "12345", success: { (userProfile) in
            print(userProfile.email ?? "")
        }) { (error) in
            print(error.localizedDescription)
        }
    }

    @IBAction func feature1BtnTapped(_ sender: Any) {
        let feature1VC = Feature1ViewController()
        
        /// Using UI components from UI Framework
        LoadingIndicator.sharedInstance.showOnWindow()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                LoadingIndicator.sharedInstance.hide()
            self.navigationController?.pushViewController(feature1VC, animated: true)
        })
    }
    
    @IBAction func feature2BtnTapped(_ sender: Any) {
    }
}

