//
//  CountryViewController.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 14/6/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController {
    
    var countryToShow: Int!
    var contIndex: Int!
    var nameOfContinent: String!
    var nameofCntry: String!
    var nameofCapital: String!
    var nameofRegion: String!
    var nameofLang: [String]!
    var nameofCurr: [String]!
    var lattLong = [Double]()
    var ref: Int!

    @IBOutlet weak var cntryNameLbl: UILabel!
    @IBOutlet weak var cntryFlagImgView: UIImageView!
    
    @IBOutlet weak var regionLbl: UILabel!
    @IBOutlet weak var regionNameLbl: UILabel!
    
    @IBOutlet weak var capitalLbl: UILabel!
    @IBOutlet weak var capitalNameLbl: UILabel!
    
    
    @IBOutlet weak var currencyLbl: UILabel!
    @IBOutlet weak var currencyNameLbl: UILabel!
    
    @IBOutlet weak var languageLbl: UILabel!
    @IBOutlet weak var languageNameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     getContinentName()
        
        cntryNameLbl.text = nameofCntry
        regionNameLbl.text = nameofRegion
        capitalNameLbl.text = nameofCapital
        currencyNameLbl.text = String(describing: lattLong[0])
        
        cntryFlagImgView.image = flagImgArray[ref]

        var lngText = ""
        for lang in langNCurrArray[ref].languages{
           
            if lngText.isEmpty {
                lngText = lang
            }
            else {
                
                lngText += " | \(lang)"
            }
        }

          languageNameLbl.text =  lngText
    
        
        var currencyText = ""
        for lang in langNCurrArray[ref].currencies{
            
            if currencyText.isEmpty {
                currencyText = lang
            }
            else {
                
                currencyText += " | \(lang)"
            }
        }
        
        currencyNameLbl.text =  currencyText

        
    }
    
    func getContinentName(){
        
        if contIndex == 0{
            
            nameOfContinent = "Asia"
            nameofCntry = asiaDetail[countryToShow].country
            nameofCapital = asiaDetail[countryToShow].capital
            nameofRegion = asiaDetail[countryToShow].subregion
            lattLong = asiaDetail[countryToShow].latlng
            ref = asiaDetailRef[countryToShow]
            
            
        }
        else if contIndex == 1{
            
            
            nameOfContinent = "Europe"
            nameofCntry = europeDetail[countryToShow].country
            nameofCapital = europeDetail[countryToShow].capital
            nameofRegion = europeDetail[countryToShow].subregion
            lattLong = europeDetail[countryToShow].latlng
             ref = europeDetailRef[countryToShow]

        }
        else if contIndex == 2{
            
            
            nameOfContinent = "North America"
            nameofCntry = northAmericaDetail[countryToShow].country
            nameofCapital = northAmericaDetail[countryToShow].capital
            nameofRegion = northAmericaDetail[countryToShow].subregion
            lattLong = northAmericaDetail[countryToShow].latlng
             ref = northAmericaDetailRef[countryToShow]

        }
        else if contIndex == 3{
            
            nameOfContinent = "South America"
            nameofCntry = southAmericaDetail[countryToShow].country
            nameofCapital = southAmericaDetail[countryToShow].capital
            nameofRegion = southAmericaDetail[countryToShow].subregion
            lattLong = southAmericaDetail[countryToShow].latlng
             ref = southAmericaDetailRef[countryToShow]

        }
        else if contIndex == 4{
            nameOfContinent = "Africa"
            nameofCntry = africaDetail[countryToShow].country
            nameofCapital = africaDetail[countryToShow].capital
            nameofRegion = africaDetail[countryToShow].subregion
            lattLong = africaDetail[countryToShow].latlng
             ref = africaDetailRef[countryToShow]

        }
            
        else if contIndex == 5{
           nameOfContinent = "Australia"
            nameofCntry = australiaDetail[countryToShow].country
            nameofCapital = australiaDetail[countryToShow].capital
            nameofRegion = australiaDetail[countryToShow].subregion
            lattLong = australiaDetail[countryToShow].latlng
             ref = australiaDetailRef[countryToShow]
            
        }
        else{
            nameOfContinent = " "
            nameofCntry = othersDetail[countryToShow].country
            nameofCapital = othersDetail[countryToShow].capital
            nameofRegion = othersDetail[countryToShow].subregion
            lattLong = othersDetail[countryToShow].latlng
             ref = othersDetailRef[countryToShow]

            
        }

    }

   
    @IBAction func mapButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "showMapView", sender: nil)
       
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       
        
        if segue.identifier == "showMapView" {
            print("Go Map")
            var nextScene =  segue.destination as! MapViewController
            nextScene.lat = lattLong[0]
            nextScene.lng = lattLong[1]
            nextScene.contIndex = self.contIndex
            nextScene.cntryToShow = self.countryToShow
        }
        
        else if segue.identifier == "backToCollView"{
            
            var prevScene = segue.destination as! ContDetailcollViewController
            prevScene.contToShow = contIndex
            
        }
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "backToCollView", sender: nil)
        
        
    }
    
    
    


}

