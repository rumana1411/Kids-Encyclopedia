//
//  MyCustomCell.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 6/6/17.
//  Copyright © 2017 ALFA. All rights reserved.
//


    import UIKit
    
    class MyCustomCell: UICollectionViewCell {
        
        var myImgView: UIImageView!
        var myLbl: UILabel!
        var myView: UIView!
        
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
          //  myView = UIView(frame: CGRect(x: 0, y: 10, width: frame.size.width, height: frame.size.height*2/3))
             myView = UIView(frame: CGRect(x: 0, y: 10, width: frame.size.width, height: frame.size.height*3/4))
            myView.backgroundColor = UIColor.gray
            
            myImgView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height*2/3))
          //   myImgView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
            myImgView.contentMode = UIViewContentMode.scaleAspectFit
            // contentView.addSubview(myImgView)
            myView.addSubview(myImgView)
            contentView.addSubview(myView)
            
            
            
            myLbl = UILabel(frame: CGRect(x: 0, y: myImgView.frame.size.height+8, width: frame.size.width, height: frame.size.height/4))
         //   myLbl.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
            myLbl.font = UIFont(name: "Bradley Hand-Bold", size: 18)
            myLbl.textAlignment = .center
            myLbl.backgroundColor = UIColor.white
            
            contentView.addSubview(myLbl)
            myView.layer.shadowRadius = 10
            myView.layer.shadowOpacity = 1
        }
        
        required init?(coder aDecoder: NSCoder) {  // Comes Auto
            fatalError("init(coder:) has not been implemented")
        }
    }
    

