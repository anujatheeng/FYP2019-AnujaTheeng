//
//  loginViewController.swift
//  MyProjectApp
//
//  Created by Anuza Theeng on 12/17/19.
//  Copyright © 2019 Anuza Theeng. All rights reserved.
//

import UIKit
import FirebaseAuth
import  SVProgressHUD
//import GoogleSignIn



class loginViewController: UIViewController {
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var instagramBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//        GIDSignIn.sharedInstance()?.presentingViewController = self
//        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
    @IBAction func FbBtnClick(_ sender: UIButton) {
        print("Facebook")
    }
    
    @IBAction func registerClick(_ sender: Any) {
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(identifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        AppDelegate.shared()?.showMainView()
    }
    
    
}









