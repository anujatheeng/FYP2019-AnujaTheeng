//
//  Settings.swift
//  Sathi
//
//  Created by Anuza Theeng on 2/27/20.
//  Copyright © 2020 Anuza Theeng. All rights reserved.
//

import Foundation
import UIKit
class Settings {
    var image:UIImage
    var title:String
    init(image:UIImage,title:String) {
        self.image = image
        self.title = title
    }
    static func settingsArray() -> [Settings]{
        var tempSettings : [Settings] = []
        let s1 = Settings(image:#imageLiteral(resourceName: "notification"), title: "Notification Button")
        let s2 = Settings(image:#imageLiteral(resourceName: "map"), title: "Location ")
        let s3 = Settings(image:#imageLiteral(resourceName: "history"), title: "History ")
        let s4 = Settings(image:#imageLiteral(resourceName: "logout"), title: "Logout")
        let s5 = Settings(image:#imageLiteral(resourceName: "feedback"), title: "Feedback")
        tempSettings.append(s1)
        tempSettings.append(s2)
        tempSettings.append(s3)
        tempSettings.append(s4)
        tempSettings.append(s5)
        
        return tempSettings
        
    }
    }
    

