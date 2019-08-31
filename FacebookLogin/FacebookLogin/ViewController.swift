//
//  ViewController.swift
//  FacebookLogin
//
//  Created by Magic IOS on 18/08/19.
//  Copyright © 2019 Magic IOS. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {
    
    @IBOutlet var fbLoginButton: FaceBookLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fbLoginButton.permissions = ["public_profile","email"]
        fbLoginButton.fbDelegate = self
    }

    
}

extension ViewController : FaceBookLoginButtonDelegate {
    func facebookLoginResponse(dictData: [String : Any]?, error: Error?) {
        if let error = error {
            print(" error ",error.localizedDescription)
        }
        if let dict = dictData {
            print("  dict ",dict)
        }
    }
    
    func facebookLogout() {
        print("logout")
    }
    
    
}
