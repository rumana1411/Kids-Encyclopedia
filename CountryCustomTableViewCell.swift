//
//  CountryCustomTableViewCell.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 14/6/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit

class CountryCustomTableViewCell: UITableViewCell {
   
    @IBOutlet weak var rowLbl: UILabel!
    
    @IBOutlet weak var rowtitleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
