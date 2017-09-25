//
//  SplashViewController.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 30/5/17.
//  Copyright © 2017 ALFA. All rights reserved.
//


import UIKit

//All Global Variables

var contDataArray = [continentList]()

//var fetchedCountryArray = [Country]()
var dummy = [Country]()
var InfoDataArray = [Country]()
var cntryArray: [String]!
var totalCntry: Int = 0


var asiaDetail = [Country]()
var europeDetail = [Country]()
var myFav = [Int]()
var northAmericaDetail  = [Country]()
var southAmericaDetail  = [Country]()
var othersAmericaDetail  = [Country]()  //Central N Caribbean

var australiaDetail  = [Country]()  //Australia n Oceania
var africaDetail  = [Country]()
var othersDetail = [Country]()   //Polar
var GeneralContDetail = [Country]()


var asiaDetailRef = [Int]()
var  europeDetailRef = [Int]()
var northAmericaDetailRef = [Int]()
var southAmericaDetailRef = [Int]()
var othersAmericaDetailRef = [Int]()
var australiaDetailRef = [Int]()
var africaDetailRef = [Int]()
var othersDetailRef = [Int]()

var cntryIndexRef = Int()
var flagImgArray = [UIImage]()
var flagEmojiArray = [String]()
var myFavRefArray = [Int]()


struct langNCurrencyStruct{
    
    var languages: [String]
    var currencies: [String]
}

struct regionInfoStruct{
    
    var region: String!
    var subregion: String!
    var regName: String!
}

var langNCurrArray: [langNCurrencyStruct] = []
var regionInfoArray: [regionInfoStruct] = []

//Global Var
    
    class SplashViewController: UIViewController {
        
        @IBOutlet weak var titleLbl: UILabel!
       
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            
            
            // To make InfoDataArray empty before loading data
            InfoDataArray.removeAll()
            asiaDetail.removeAll()
            europeDetail.removeAll()
            southAmericaDetail.removeAll()
            northAmericaDetail.removeAll()
            australiaDetail.removeAll()
            africaDetail.removeAll()
            othersAmericaDetail.removeAll()
            othersDetail.removeAll()
            myFav.removeAll()
            flagImgArray.removeAll()
            myFavRefArray.removeAll()
            
            //Load Data
            
            // contDataArray = Data.getContinentData()
            Data.getContinentData()

            Data.parseJson()
            totalCntry = InfoDataArray.count
            print("Liza \(InfoDataArray.count) \(totalCntry)")
            //splitContinents()
            

            
            
            
            
            //Code of splash screen
            UIView.animate(withDuration: 4) {
                   self.titleLbl.alpha = 1
            }
            
            perform(#selector(SplashViewController.showNavFunc), with: nil, afterDelay: 6)
        }
        
        func showNavFunc(){
            print("Ahsan")
            
           // performSegue(withIdentifier: "ShowNav", sender: nil)  //For Old menu
            performSegue(withIdentifier: "showNewNav", sender: nil)  //For New Menu
        }
        

              
}
