//
//  EmergencyContactTableViewCell.swift
//  MyProjectApp
//
//  Created by Anuza Theeng on 2/13/20.
//  Copyright © 2020 Anuza Theeng. All rights reserved.
//

import UIKit

class EmergencyContactTableViewCell: UITableViewCell {
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var relationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
