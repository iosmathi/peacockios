//
//  BeaconTableViewCell.swift
//  Peacock
//
//  Created by NRV Prasad on 25/09/18.
//  Copyright © 2018 Mathivathani Murugesan. All rights reserved.
//

import UIKit

class BeaconTableViewCell: UITableViewCell {

    @IBOutlet weak var btnCheck: UIButton!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgProfilePic: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
