//
//  AuthService.swift
//  Instagram
//
//  Created by Anuza Theeng on 9/29/19.
//  Copyright © 2019 Anuza Theeng. All rights reserved.
//

import Foundation
import Firebase
class AuthService: NSObject{
   
    static func setUserInformation(email: String, fullName: String, password: String, username: String, uid: String,profileImage: String) {
        let ref = Database.database().reference()
        let usersReference = ref.child("users")
        let newUserReference = usersReference.child(uid)
        newUserReference.setValue(["username": username, "email" : email, "profileImage" : profileImage])
        print("description: \(newUserReference.description())")
    }
    
    static func setUserImfromtions(firstName: String, lastName: String, country: String,phone: String,email: String,password: String,uid: String){
        let ref = Database.database().reference()
        let usersReference = ref.child("users")
        let newUserReference = usersReference.child(uid)
        newUserReference.setValue(["firstName": firstName, "lastName" : lastName, "country" : country,"phone":phone,"password":password,"email":email])
        print("description: \(newUserReference.description())")
    }
    
}
