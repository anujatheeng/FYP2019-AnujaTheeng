//
//  EmergencyContactListViewController.swift
//  MyProjectApp
//
//  Created by Anuza Theeng on 2/7/20.
//  Copyright © 2020 Anuza Theeng. All rights reserved.
//

import UIKit
protocol DataPass {
func data(object:[String:String], index:Int, isEdit:Bool)
}

class EmergencyContactListViewController: UIViewController {
    
    
    @IBOutlet weak var EmergencyContactTableView: UITableView!
    var emercontact = [AddEmergencyContact]()
    var delegate:DataPass!
    override func viewDidLoad() {
        super.viewDidLoad()
        emercontact = MyProjectHepler.shareInstance.getEmergencyContactData()
    }
}
extension EmergencyContactListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emercontact.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmergencyContactTableViewCell", for: indexPath) as! EmergencyContactTableViewCell
        cell.nameLabel.text = "Name: \(emercontact[indexPath.row].name ?? "")"
        cell.contactLabel.text = "Contact: \(emercontact[indexPath.row].contact ?? "")"
        cell.relationLabel.text = "Relation: \(emercontact[indexPath.row].relation ?? "")"
        cell.imageView?.image = UIImage(data: emercontact[indexPath.row].image ?? Data())
        print(emercontact[indexPath.row].image ?? "xina image")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let  dict = ["name":emercontact[indexPath.row].name,"relation":emercontact[indexPath.row].relation,"contact":emercontact[indexPath.row].contact]
        delegate.data(object: dict as! [String:String], index:indexPath.row, isEdit: true)
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            emercontact = MyProjectHepler.shareInstance.deleteData(index: indexPath.row)
            self.EmergencyContactTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
}
