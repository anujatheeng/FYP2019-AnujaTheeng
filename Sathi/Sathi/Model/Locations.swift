//
//  locations.swift
//  MyProjectApp
//
//  Created by Anuza Theeng on 2/24/20.
//  Copyright © 2020 Anuza Theeng. All rights reserved.
//

import Foundation
import UIKit


class Locations {
    var name: String?
    var latitude: Double?
    var longtitude: Double?
    var type: String?
    var locations: String?
    init(name: String, latitude: Double, longtitude: Double, type:String, locations:String) {
        self.name = name
        self.latitude = latitude
        self.longtitude = longtitude
        self.type = type
        self.locations = locations
    }
    
    static func getLocation() -> [Locations]{
        var tempLocation:[Locations] = []
        let prone1 = Locations(name: "Teku",latitude:27.6954 ,longtitude: 85.3039 ,type: "Prone",locations: "Teku,Kathmandu")
        let prone2 = Locations(name: "Bhuwankhel Marg",latitude: 27.7131 ,longtitude: 85.2919 ,type: "Prone",locations: "Swayambhu,Kathmandu")
        let prone3 = Locations(name: "Ratna Park Path ",latitude: 27.7066 ,longtitude: 85.3145,type: "Prone",locations: "Ratna Park Path Kathmandu")
        let prone4 = Locations(name: "Trishuli Highway, Kathmandu 44600",latitude: 27.732138 ,longtitude: 85.302992,type: "Prone",locations: "Balaju")
        let prone5 = Locations(name: "New Bardali Cafe ,Restaurant and Bar",latitude: 27.677520 ,longtitude: 85.316044,type: "Prone",locations: "Pulchowk Road, Lalitpur 44600")
        let police1 = Locations(name:"Kalimati Police Station" ,latitude:27.6973 ,longtitude: 85.2995 ,type: "police" ,locations: "Kalimati,Kathmandu")
        let police2 = Locations(name: "Swayambhu Police Station" ,latitude: 27.7136 ,longtitude: 85.2926 ,type: "police" ,locations: "Swayambhu")
        let police3 = Locations(name: "Metropolitan Police Office" ,latitude: 27.7068 ,longtitude: 85.3160, type: "police", locations: "Ratna Park Path, Kathmandu ")
        let police4 = Locations(name: "Balaju Police station" ,latitude: 27.7324 ,longtitude: 85.3028,type: "police" ,locations: "Trishuli Highway, Kathmandu")
        let police5 = Locations(name: "Lalitpur Metropolitan City Office" ,latitude: 27.6766 ,longtitude: 85.3168 ,type: "police",locations: "Lalitpur")
        
        
        tempLocation.append(prone1)
        tempLocation.append(prone2)
        tempLocation.append(prone3)
        tempLocation.append(prone4)
        tempLocation.append(prone5)
        tempLocation.append(police1)
        tempLocation.append(police2)
        tempLocation.append(police3)
        tempLocation.append(police4)
        tempLocation.append(police5)
        
        return tempLocation
            
        }
    }







