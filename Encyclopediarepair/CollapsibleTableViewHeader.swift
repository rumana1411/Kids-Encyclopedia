//
//  CollapsibleTableViewHeader.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 10/8/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit

protocol CollapsibleTableViewHeaderDelegate {
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int)
}

class CollapsibleTableViewHeader: UITableViewHeaderFooterView {
    
    var delegate: CollapsibleTableViewHeaderDelegate?
    var section: Int = 0
    
    let flagLabel = UILabel()
   // let flagView = UIImageView()
    let titleLabel = UILabel()
    let arrowLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        // Content View
     //   contentView.backgroundColor = UIColor(hex: 0x2E3944)
        contentView.backgroundColor = UIColor(hex: 0x30A0FD)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        // Arrow label
        contentView.addSubview(arrowLabel)
        arrowLabel.textColor = UIColor.white
        arrowLabel.translatesAutoresizingMaskIntoConstraints = false
        arrowLabel.widthAnchor.constraint(equalToConstant: 12).isActive = true
        arrowLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        arrowLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        arrowLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        
        // Title label
        contentView.addSubview(titleLabel)
       // titleLabel.textColor = UIColor.green
        titleLabel.textColor = UIColor(hex: 0x177D4F)
      //  titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.font = UIFont(name: "Bradley Hand", size: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 35).isActive = true
        
        
        // FlagEmoji label
         contentView.addSubview(flagLabel)
         flagLabel.font = UIFont.systemFont(ofSize: 30)
         flagLabel.translatesAutoresizingMaskIntoConstraints = false
         flagLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
         flagLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
         flagLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
         flagLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        
        
        
//        contentView.addSubview(flagView)
//        flagView.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
//        flagView.translatesAutoresizingMaskIntoConstraints = false
//        flagView.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
//        flagView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
//        flagView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
//        flagView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true


        
        //
        // Call tapHeader when tapping on this header
        //
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CollapsibleTableViewHeader.tapHeader(_:))))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //
    // Trigger toggle section when tapping on the header
    //
    func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? CollapsibleTableViewHeader else {
            return
        }
        
        delegate?.toggleSection(self, section: cell.section)
    }
    
    func setCollapsed(_ collapsed: Bool) {
        //
        // Animate the arrow rotation (see Extensions.swf)
        //
        arrowLabel.rotate(collapsed ? 0.0 : .pi / 2)
    }
    
}
