//
//  extraViewController.swift
//  MyProjectApp
//
//  Created by Anuza Theeng on 2/7/20.
//  Copyright © 2020 Anuza Theeng. All rights reserved.
//

import UIKit

class extraViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    class EmergencyContactViewController: UIViewController {
        @IBOutlet weak var tableview: UITableView!
        
        //var emergencyContact = EmergencyContacts.createArray()
        override func viewDidLoad() {
            super.viewDidLoad()
            let button1 = UIBarButtonItem(barButtonSystemItem: .add , target: self, action: #selector(tapButton))
            self.navigationItem.rightBarButtonItem  = button1
            
        }
        @objc func tapButton() {
            print("Clicked")
        }
    }
    //extension EmergencyContactViewController: UITableViewDataSource {
        //func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            //return emergencyContact.count
        //}
        //func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           // let newuser = emergencyContact[indexPath.row]
            //let cell = tableView.dequeueReusableCell(withIdentifier: "EmergencyContactsCell") as! EmergencyContactsCell
            //cell.selectionStyle = .none
            //cell.setEmergencyContacts(newuser: newuser)
            //return cell
        //}
        //func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          //  return 300
            
            
            
            
            
}
