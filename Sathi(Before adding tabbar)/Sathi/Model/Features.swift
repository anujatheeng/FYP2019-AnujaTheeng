//
//  Features.swift
//  MyProjectApp
//
//  Created by Anuza Theeng on 1/21/20.
//  Copyright © 2020 Anuza Theeng. All rights reserved.
//

import Foundation
import UIKit

class Features {
    var image:UIImage
    var title:String
    init(image:UIImage, title:String) {
        self.image = image
        self.title = title
    }
    static func createArray() -> [Features] {
        var tempFeature: [Features] = []
        let alertFeature = Features(image: #imageLiteral(resourceName: "alert"), title:"Alert Button")
        let callFeature = Features(image: #imageLiteral(resourceName: "call"), title:"Emergency Contact")
        let policestationtFeature = Features(image: #imageLiteral(resourceName: "police-car"), title:"Nearby PoliceStation")
        let proneAreaFeature = Features(image: #imageLiteral(resourceName: "location"), title:"Prone Zone Area")
        let emergencySoundFeature = Features(image: #imageLiteral(resourceName: "emergency"), title:"Emergency sound")
        let aboutAppFeature = Features(image: #imageLiteral(resourceName: "info"), title:"About App")
        
        
        tempFeature.append(alertFeature)
        tempFeature.append(callFeature)
        tempFeature.append(policestationtFeature)
        tempFeature.append(proneAreaFeature)
        tempFeature.append(emergencySoundFeature)
        tempFeature.append(aboutAppFeature)
        return tempFeature
        
    }

}

