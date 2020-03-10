//
//  SettingsTableCell.swift
//  Sathi
//
//  Created by Anuza Theeng on 2/27/20.
//  Copyright © 2020 Anuza Theeng. All rights reserved.
//

import UIKit

class SettingsTableCell: UITableViewCell {
    @IBOutlet weak var bellImage: UIImageView!
    
    @IBOutlet weak var notificationsLabel: UILabel!
    @IBOutlet weak var `switch`: UISwitch!
    
    func setSettings(newsetting: Settings){
        bellImage.image = newsetting.image
        notificationsLabel.text = newsetting.title
    }
}
