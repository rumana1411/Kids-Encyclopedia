//
//  ViewController.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 3/5/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var menuShowing: Bool!

    @IBOutlet weak var menuButtonLine: UIButton!
    @IBOutlet weak var myTopView: gradiantView! // top View with gradiant color
    
    @IBOutlet var myMenuView: UIView! // lower View with menu
    
    @IBOutlet weak var leadCons: NSLayoutConstraint!
   
   
    @IBOutlet weak var traillCons: NSLayoutConstraint!
   
    
    
    @IBAction func menuButton(_ sender: UIButton) {
        
        if menuShowing == false{
            
            leadCons.constant = 200
            traillCons.constant = -100
            
            
        }else{
            
           leadCons.constant = 0
           traillCons.constant = 0
        
    }
        
      print("\(menuShowing)")
        UIView.animate(withDuration: 0.3) {  // if you made the duration 0.03 instead of 0.3 you cannot feel it sliding
            self.view.layoutIfNeeded()
        }
        menuShowing = !menuShowing
}
    

    
    @IBAction func continentButton(_ sender: UIButton) {
        
       performSegue(withIdentifier: "ShowContinents", sender: nil)
    }
    
   
    @IBAction func favButton(_ sender: UIButton) {
    }
    
    @IBAction func countriesButton(_ sender: UIButton) {
        
        
        performSegue(withIdentifier: "ShowCountry", sender: nil)
    }
   
    @IBAction func quizButton(_ sender: UIButton) {
    }
    
    @IBAction func gameButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  leadCons.constant = 0
       // trailCons.constant = 0

        menuShowing = false
        print("\(menuShowing) from load")

      myTopView.layer.shadowOpacity = 1
        myTopView.layer.shadowRadius = 5
    
    }

   
}

