//
//  ProfileTC.swift
//  Boxi Park Visitor
//
//  Created by Atlas-Labs on 5/22/19.
//  Copyright © 2019 Atlas-Labs. All rights reserved.
//

import UIKit

class ProfileTC: UITableViewCell {

    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var btnHistory: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        btnHistory?.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
