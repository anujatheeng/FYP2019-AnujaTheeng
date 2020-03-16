//
//  FeaturesTableViewCell.swift
//  MyProjectApp
//
//  Created by Anuza Theeng on 1/21/20.
//  Copyright © 2020 Anuza Theeng. All rights reserved.
//

import UIKit

class FeaturesCell: UITableViewCell {
    
    @IBOutlet weak var alertImageView: UIImageView!
    @IBOutlet weak var alertlabel: UILabel!
    
    func setFeatures(newFeature: Features) {
        alertImageView.image = newFeature.image
        alertlabel.text = newFeature.title
    }
}
