//
//  AlertController.swift
//  Sathi
//
//  Created by Anuza Theeng on 3/13/20.
//  Copyright © 2020 Anuza Theeng. All rights reserved.
//

import Foundation
import UIKit
class AlertController {
    static func showAlert(_ inViewController: UIViewController, title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        inViewController.present(alert, animated: true, completion: nil)
    }
}
