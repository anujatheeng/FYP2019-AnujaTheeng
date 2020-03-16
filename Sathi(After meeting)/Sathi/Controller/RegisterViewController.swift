//
//  registerViewController.swift
//  MyProjectApp
//
//  Created by Anuza Theeng on 12/17/19.
//  Copyright © 2019 Anuza Theeng. All rights reserved.
//

import UIKit

import FirebaseAuth
import SVProgressHUD
import  FirebaseStorage
import  FirebaseDatabase


class RegisterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    var ref: DatabaseReference!
    let myPickerData = [String](arrayLiteral: "Asia", "Nepal", "Australia", "Kathmandu", "Bhaktapur")
    var selectedRow = 0
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = row
        countryTxt.text = myPickerData[row]
        self.view.endEditing(false)
    }
    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var countryTxt: UITextField!
    @IBOutlet weak var phoneTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var reLoginBtn: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Register"
        createThePicker()
        handleTextfield()
        let thePicker = UIPickerView()
        countryTxt.inputView = thePicker
        thePicker.delegate = self
        let firstNameImage = UIImage(named: "f1")
        addLeftImageTo(txtField: firstNameTxt, andImage: firstNameImage!)
        let lastNameImage = UIImage(named: "f1")
               addLeftImageTo(txtField: lastNameText, andImage: lastNameImage!)
        let countryImage = UIImage(named: "country")
        addLeftImageTo(txtField: countryTxt, andImage: countryImage!)
        let phoneImage = UIImage(named: "phone")
               addLeftImageTo(txtField: phoneTxt, andImage: phoneImage!)
        let emailImage = UIImage(named: "mail2")
               addLeftImageTo(txtField: emailTxt, andImage: emailImage!)
        let passwordImage = UIImage(named: "password")
        addLeftImageTo(txtField: passwordTxt, andImage: passwordImage!)
        }
    func addLeftImageTo(txtField:UITextField, andImage img:UIImage){
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
         }
    func createThePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClicked))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPicker))
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        countryTxt.inputAccessoryView = toolbar
        
    }
    @objc func doneClicked() {
        self.countryTxt.text = myPickerData[selectedRow]
        countryTxt.resignFirstResponder()
    }
    @objc func cancelPicker() {
        self.view.endEditing(true)
    }
    func handleTextfield() { // to check the text field
        firstNameTxt.addTarget(self,action: #selector(RegisterViewController.textFieldDidChange),  for: UIControl.Event.editingChanged)
        lastNameText.addTarget(self,action:#selector(RegisterViewController.textFieldDidChange),  for:UIControl.Event.editingChanged)
        countryTxt.addTarget(self,action:#selector(RegisterViewController.textFieldDidChange),  for:UIControl.Event.editingChanged)
        emailTxt.addTarget(self,action:#selector(RegisterViewController.textFieldDidChange),  for:UIControl.Event.editingChanged)
        phoneTxt.addTarget(self,action:#selector(RegisterViewController.textFieldDidChange),  for:UIControl.Event.editingChanged)
        passwordTxt.addTarget(self,action:#selector(RegisterViewController.textFieldDidChange),  for:UIControl.Event.editingChanged)
    }
    @objc func textFieldDidChange() {
        guard let firstName = firstNameTxt.text, !firstName.isEmpty, let lastName = lastNameText.text, !lastName.isEmpty ,let email = emailTxt.text , !email.isEmpty, let password = passwordTxt.text, !password.isEmpty ,let phone = phoneTxt.text, !phone.isEmpty, let country = countryTxt.text, !country.isEmpty else {
            registerBtn.setTitleColor(UIColor.lightText, for: UIControl.State.normal)
            registerBtn.isEnabled = false
            return
            
        }
        registerBtn.setTitleColor(UIColor.green, for: UIControl.State.normal)
        registerBtn.isEnabled = true
    }
    
    @IBAction func clickOnRegisterBtn(_ sender: Any) {
        guard let firstName = firstNameTxt.text, !firstName.isEmpty, let lastName = lastNameText.text, !lastName.isEmpty ,let email = emailTxt.text , !email.isEmpty, let password = passwordTxt.text, !password.isEmpty ,let phone = phoneTxt.text, !phone.isEmpty, let country = countryTxt.text, !country.isEmpty else {
            AlertController.showAlert(self, title: "Missing Information", message: "Please fill out the fields carefully")
            return
        }
        Auth.auth().createUser(withEmail:emailTxt.text!, password:passwordTxt.text!,completion: { (User,Error)  in
            if Error != nil {
                print(Error!.localizedDescription)
                return
            }
            let ref = Database.database().reference()
            let usersReference = ref.child("users")
            // print(usersReference.description()): gs://myprojectapp-f30ff.appspot.com
            let uid = User?.user.uid
            let newUserReference = usersReference.child(uid!)
            newUserReference.setValue(["username": self.firstNameTxt.text!,"email": self.emailTxt.text! ])
            print("description:\(newUserReference.description())")
           _ = Storage.storage().reference(forURL: "gs://myprojectapp-f30ff.appspot.com").child("userrrrr").child(uid!)
            AuthService.setUserImfromtions(firstName: self.firstNameTxt.text!, lastName: self.lastNameText.text!, country: self.countryTxt.text!, phone: self.phoneTxt.text!, email: self.emailTxt.text!, password: self.passwordTxt.text!, uid: uid!)
            SVProgressHUD.showSuccess(withStatus: "Success")
           let story = UIStoryboard.init(name: "Main", bundle: nil)
           let vc = story.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
           self.navigationController?.pushViewController(vc, animated: true)
        })
    }
    
    @IBAction func reLoginButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
//    @IBAction func clickAfterRegistration(_ sender: Any) {
//        let story = UIStoryboard.init(name: "Main", bundle: nil)
//        let vc = story.instantiateViewController(identifier: "HomeViewController") as HomeViewController
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    
//    else{
//        AlertController.showAlert(self, title: "Missing Information", message: "Please fill oput all the fields")
//    return
}

