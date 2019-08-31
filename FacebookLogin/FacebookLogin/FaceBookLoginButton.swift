//
//  FaceBookLoginButton.swift
//  FacebookLogin
//
//  Created by Magic IOS on 31/08/19.
//  Copyright © 2019 Magic IOS. All rights reserved.
//

import Foundation
import UIKit
import FBSDKLoginKit

protocol FaceBookLoginButtonDelegate {
    func facebookLoginResponse(dictData:[String:Any]?,error:Error?)
    func facebookLogout()
}
class FaceBookLoginButton : FBLoginButton,LoginButtonDelegate {
    
    var fbDelegate : FaceBookLoginButtonDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
        
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if let error = error {
            fbDelegate?.facebookLoginResponse(dictData: nil, error: error)
            return
        }else if let _ = result {
            facebookLogin()
            return
        }else {
            fbDelegate?.facebookLoginResponse(dictData: nil, error: nil)
            return
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        fbDelegate?.facebookLogout()
    }
    
    func facebookLogin(){
        
        let params = ["fields" : "first_name, last_name , email  , picture.type(large)"]
        GraphRequest.init(graphPath: "me", parameters: params).start { (connection, result, error ) in
            if let error = error {
                
                self.fbDelegate?.facebookLoginResponse(dictData: nil, error: error)
                return
            }else if let response = result as? [String:Any] {
                self.fbDelegate?.facebookLoginResponse(dictData: response, error: nil)
                return
            }else {
                self.fbDelegate?.facebookLoginResponse(dictData: nil, error: nil)
                return
            }
            
        }
    }
    
}
