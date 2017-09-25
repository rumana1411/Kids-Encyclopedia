//
//  ExtTableViewCell.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 31/7/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit

class ExtTableViewCell: UITableViewCell {

    
    
   
    
    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var myViewHCons: NSLayoutConstraint!
    
    @IBOutlet weak var flagImgView: UIImageView!
    
    
    @IBOutlet weak var continentLbl: UILabel!
    
    @IBOutlet weak var contLblHCons: NSLayoutConstraint!
    @IBOutlet weak var cntryNameLbl: UILabel!
   
    @IBOutlet weak var flagImgViewHCons: NSLayoutConstraint!
    
    
    @IBOutlet weak var cntryLblHCons: NSLayoutConstraint!
    
    @IBOutlet weak var capitalLbl: UILabel!
    
    @IBOutlet weak var capitalLblHCons: NSLayoutConstraint!
    @IBOutlet weak var currencyLbl: UILabel!
    
    @IBOutlet weak var currencyLblHCons: NSLayoutConstraint!
    @IBOutlet weak var languageLbl: UILabel!
    
    @IBOutlet weak var languageLblHCons: NSLayoutConstraint!
    
    var isExpanded: Bool = false
    {
        didSet
        {
            if !isExpanded {
                self.myViewHCons.constant = 0.0
                self.flagImgViewHCons.constant = 0.0
                self.capitalLblHCons.constant = 0.0
                self.currencyLblHCons.constant = 0.0
                self.languageLblHCons.constant = 0.0
                self.contLblHCons.constant = 0.0
                
            } else {
                self.myViewHCons.constant = 135.0
                self.flagImgViewHCons.constant = 120.0
                self.capitalLblHCons.constant = 37.0
                self.currencyLblHCons.constant = 37.0
                self.languageLblHCons.constant = 37.0
                self.contLblHCons.constant = 35.0
            }
        }
    }

    
}
