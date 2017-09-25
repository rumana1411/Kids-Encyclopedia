//
//  GKQ.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 16/8/17.
//  Copyright © 2017 ALFA. All rights reserved.
//


import Foundation
class GKQ{
    
    var quesQ: String = ""
    var ansQ: String = ""
    var options = [String]()
    
    
    init(quesQ: String, ansQ: String, options: [String]){
        
        self.quesQ = quesQ
        self.ansQ = ansQ
        self.options = options as [String]
        
    }
}
