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
        let emailImage = UIImage(named: "mail2")
        addLeftImageTo(txtField: emailTxtField, andImage: emailImage!)
        let passwordImage = UIImage(named: "password")
        addLeftImageTo(txtField: passwordTxtField, andImage: passwordImage!)
        handleTextfield()
        
        
        //        GIDSignIn.sharedInstance()?.presentingViewController = self
        //        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
    @IBAction func FbBtnClick(_ sender: UIButton) {
        print("Facebook")
    }
    func addLeftImageTo(txtField:UITextField, andImage img:UIImage){ // adding images on the left side of the text field
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
        
    }
    func handleTextfield() { // to handle the text field
        emailTxtField.addTarget(self,action: #selector(RegisterViewController.textFieldDidChange),  for: UIControl.Event.editingChanged)
        passwordTxtField.addTarget(self,action: #selector(RegisterViewController.textFieldDidChange),  for:UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange() { // to check the changes in the text field
        guard let email = emailTxtField.text , !email.isEmpty, let password = passwordTxtField.text, !password.isEmpty  else {
            loginBtn.setTitleColor(UIColor.lightText, for: UIControl.State.normal) // changes the login button to lighttext as the above condition meets
            loginBtn.isEnabled = false
            
            return
            
        }
        loginBtn.setTitleColor(UIColor.green, for: UIControl.State.normal) // changes the button color to green if all the text field are filled up
        loginBtn.isEnabled = true
    }
    
    
    @IBAction func registerClick(_ sender: Any) {
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(identifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        AppDelegate.shared()?.showMainView()
    }
    
    @IBAction func clickOnLoginBtn(_ sender: Any) {
        view.endEditing(true)
        //SVProgressHUD.show(withStatus: "Waiting")
        guard let email = emailTxtField.text , !email.isEmpty, let password = passwordTxtField.text, !password.isEmpty
            
            else {
                AlertController.showAlert(self, title: "Missing Information", message: "Please fill out the fields carefully")
                return
        }
        Auth.auth().signIn(withEmail: emailTxtField.text!, password: passwordTxtField.text!, completion: { (user,error) in
            guard error == nil else { // checking  and throwing errors whether the users has registered or not
                AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                return
            }
            SVProgressHUD.showSuccess(withStatus: "Success")
            
            let story = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = story.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
            self.navigationController?.pushViewController(vc, animated: true)
            //SVProgressHUD.showSuccess(withStatus: "Success")
            
        })
        
        
        
    }
}












