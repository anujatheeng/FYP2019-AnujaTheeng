//
//  MyProjectHelper.swift
//  MyProjectApp
//
//  Created by Anuza Theeng on 2/7/20.
//  Copyright © 2020 Anuza Theeng. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class MyProjectHepler {
    static var shareInstance = MyProjectHepler()
    let context = AppDelegate.shared()?.persistentContainer.viewContext
    func save(Object:[String:Any]) {
        let emergencyContact = NSEntityDescription.insertNewObject(forEntityName: "AddEmergencyContact", into: context!) as! AddEmergencyContact
        emergencyContact.name = Object["name"] as? String
        emergencyContact.relation = Object["relation"] as? String
        emergencyContact.contact = Object["contact"] as? String
        emergencyContact.image = Object["image"] as? Data
        do{
            try context!.save()
        }catch{
            print("Data is not saved")
            
        }
    }
    func saveImage(data: Data) {
        let imageInstance = AddEmergencyContact(context: context!)
        imageInstance.image = data
        do {
            try context!.save()
            print("Image is saved")
        } catch {
            print(error.localizedDescription)
        }
    }
    func getEmergencyContactData() ->[AddEmergencyContact]{
    var emergencyContact = [AddEmergencyContact]()
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "AddEmergencyContact")
    do{
        emergencyContact = try context?.fetch(fetchRequest) as! [AddEmergencyContact]
    }catch{
        print("CANNOT FETCH THE DATA")
    }
    return emergencyContact
}
    func deleteData(index:Int) ->[AddEmergencyContact]{
        var emergencyContact = getEmergencyContactData()
        context?.delete(emergencyContact[index])
        emergencyContact.remove(at: index)
        do{
            try context?.save()
            }catch{
            print("cannot delete data")
        }
        return emergencyContact
    }
   func editData(object:[String:String], i:Int){
    let emerContact = getEmergencyContactData()
        emerContact[i].name = object["name"]
        emerContact[i].relation = object["relation"]
        emerContact[i].contact = object["contact"]
        do {
            try context?.save()
        }catch{
            print("Data cannot be edited or changed")
        }
    }
}

