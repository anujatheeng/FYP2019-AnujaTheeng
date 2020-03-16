//
//  EmergencyContactViewController.swift
//  MyProjectApp
//
//  Created by Anuza Theeng on 1/23/20.
//  Copyright © 2020 Anuza Theeng. All rights reserved.
//

import UIKit

class EmergencyContactViewController: UIViewController {
    fileprivate let application = UIApplication.shared

    
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var relationTxt: UITextField!
    @IBOutlet weak var contactTxt: UITextField!
    let imagePicker = UIImagePickerController()
    var isUpdate = Bool()
    var i = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        userPhoto.addGestureRecognizer(tapGesture)
        userPhoto.isUserInteractionEnabled = true
    }
    @objc func imageTapped() {
        let alert = UIAlertController(title: "Change Photo", message: "what would ypou like to access?", preferredStyle: UIAlertController.Style.alert)
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
    
    @IBAction func clickOnCallBtn(_ sender: UIButton) {
        if let phoneURL = URL(string: contactTxt.text!){
            if application.canOpenURL(phoneURL){
                application.open(phoneURL, options: [:], completionHandler: nil)
            }
        }
    }
    @IBAction func saveBtnClick(_ sender: Any) {
        if let imageData = userPhoto.image?.pngData() {
            let dict = ["name":nameTxt.text!,"relation":relationTxt.text!,"contact":contactTxt.text!,"image": imageData] as [String : Any]
            if isUpdate{
                MyProjectHepler.shareInstance.editData(object: dict as! [String:String], i: i)
            }else{
                MyProjectHepler.shareInstance.save(Object: dict)
            }
        }
    }
    @IBAction func showBtnClick(_ sender: Any) {
        let ListVC = self.storyboard?.instantiateViewController(identifier: "EmergencyContactListViewController") as! EmergencyContactListViewController
        ListVC.delegate = self
        self.navigationController?.pushViewController(ListVC, animated: true)
    }
    
    
    
}
extension EmergencyContactViewController : DataPass {
    func data(object: [String : String], index: Int, isEdit: Bool) {
        nameTxt.text = object["name"]
        relationTxt.text = object["relation"]
        contactTxt.text = object["contact"]
        i = index
        isUpdate = isEdit
    }
}
extension EmergencyContactViewController :  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
        userPhoto.contentMode = .scaleAspectFit
        userPhoto.image = pickedImage
    } 
    dismiss(animated: true, completion: nil)
}
func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
}
}
    






