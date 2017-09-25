//
//  TestCell.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 24/7/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit

class TestCell: UITableViewCell {

    @IBOutlet weak var flagImgView: UIImageView!
    
    @IBOutlet weak var flagLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
