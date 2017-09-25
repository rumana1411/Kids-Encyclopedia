//
//  gradiantView.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 3/5/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit

@IBDesignable

class gradiantView: UIView {
    
    
        @IBInspectable var FirstColor: UIColor = UIColor.blue{
            
            didSet{
                updateView()
            }
            
        }
        
        
        @IBInspectable var SecondColor: UIColor = UIColor.red{
            
            didSet{
                updateView()
            }
            
        }
        
        
        override class var layerClass: AnyClass {
            
            get{
                return CAGradientLayer.self
                
            }
            
            
        }
        
        func updateView(){
            
            var newLayer = layer as! CAGradientLayer
            newLayer.colors = [FirstColor.cgColor,SecondColor.cgColor]
            
        }
        
    }



