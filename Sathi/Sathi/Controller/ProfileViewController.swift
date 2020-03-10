//
//  ProfileViewController.swift
//  Sathi
//
//  Created by Anuza Theeng on 2/26/20.
//  Copyright © 2020 Anuza Theeng. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            profileImage.addGestureRecognizer(tapGesture)
            profileImage.isUserInteractionEnabled = true
        }
        @objc func imageTapped() {
            let alert = UIAlertController(title: "Add Photo", message: "what would ypou like to access?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (alert) in
                self.openGallery()
            }))
            alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (alert) in
                self.openCamera()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        @objc func openGallery(){
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
        }
        @objc func openCamera(){
            if (UIImagePickerController .isSourceTypeAvailable(.camera)){
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            }else{
                let alertWarning = UIAlertController(title: "Warning", message: "No Camera Found", preferredStyle: .alert)
                let okBtn = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alertWarning.addAction(okBtn)
                present(alertWarning, animated: true, completion: nil)
            }


        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func clickOnSaveBtn(_ sender: Any) {
    }
    

}
