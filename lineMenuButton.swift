//
//  lineMenuButton.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 3/5/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit

class lineMenuButton: UIButton {

    
        override func draw(_ rect: CGRect) {
            
            // thickness of your line
            let lineThick:CGFloat = 4.0
            
            // length of your line relative to your button
            let lineLenght:CGFloat = min(bounds.width, bounds.height) * 0.8
            
            // color of your line
            let lineColor: UIColor = UIColor.black
            
            // this will add small padding from button border to your first line and other lines
            let marginGap: CGFloat = 5.0
            
            // we need three line
            
            for line in 0...2 {
                
                // create path
                
                let linePath = UIBezierPath()
                linePath.lineWidth = lineThick
                
                //start point of line
                
                linePath.move(to: CGPoint(
                    x: bounds.width/2 - lineLenght/2,
                    y: 6.0 * CGFloat(line) + marginGap
                ))
                
                //end point of line
                
                linePath.addLine(to: CGPoint(
                    x: bounds.width/2 + lineLenght/2,
                    y: 6.0 * CGFloat(line) + marginGap
                ))
                //set line color
                
                lineColor.setStroke()
                
                //draw the line
                
                linePath.stroke()
            }
            
            
        }
        
        
    }
    
    


