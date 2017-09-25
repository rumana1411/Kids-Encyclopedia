//
//  HomeMenuViewController.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 18/7/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit



class HomeMenuViewController: UIViewController {
   
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var menuVLeadCons: NSLayoutConstraint!

    
        var menuShowing = false
        
       @IBAction func menuButton(_ sender: UIButton) {
        
        if menuShowing == false{
            
            
            menuVLeadCons.constant = 0
        
            
            
        }else{
            
            menuVLeadCons.constant = -200   // leading constraint of top image view
       
        }
        
        
        UIView.animate(withDuration: 0.3) {  // if you made the duration 0.03 instead of 0.3 you cannot feel it sliding
            self.view.layoutIfNeeded()
        }
        
           menuShowing = !menuShowing
    }
    
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
       //  myTopImgView.image = UIImage(named: "image3.jpg") //if you set the content mode of UIImageView as aspect fill, the sliding effect cannot be shown...set aspect fit/scale fill
      //   myLabel.text = "Kid's Encyclopedia"
            
            //Hiding Navigation Bar
            self.navigationController?.isNavigationBarHidden = true
            
           splitData()
            
//            print("From HomeView Info\(InfoDataArray.count)")
//            print("Append: My Favourite: \(myFav.count)")
//            print("Append: My Favourite: \(myFavRefArray.count)")
//            print("FlagImgArray: \(flagImgArray.count)")
            
     //
            menuView.layer.shadowOpacity = 1
            menuView.layer.shadowRadius = 3
            
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
            swipeLeft.direction = UISwipeGestureRecognizerDirection.left
            // view.addGestureRecognizer(swipeLeft)
            menuView.addGestureRecognizer(swipeLeft)
            
            
            let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
            swipeRight.direction = UISwipeGestureRecognizerDirection.right
            view.addGestureRecognizer(swipeRight)
    }
    
    func swipeAction(swipe: UISwipeGestureRecognizer){
        
        switch swipe.direction.rawValue {
        case 1:
            if menuShowing == false{
           // print("right")
            menuVLeadCons.constant = 0
            menuShowing = !menuShowing
              //  print(menuShowing)
            UIView.animate(withDuration: 0.3) {  // if you made the duration 0.03 instead of 0.3 you cannot feel it sliding
                self.view.layoutIfNeeded()
            }
          }
        case 2:
            if menuShowing == true{
           // print("left")
            menuVLeadCons.constant = -200
                menuShowing = !menuShowing
              //  print(menuShowing)
            UIView.animate(withDuration: 0.3) {  // if you made the duration 0.03 instead of 0.3 you cannot feel it sliding
                self.view.layoutIfNeeded()
            }
          }
        default:
            break
        }
        
    }
    
    
    @IBAction func contButton(_ sender: UIButton) {
        
      performSegue(withIdentifier: "ShowContinents", sender: nil)
    }
    
    
    @IBAction func cntryButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "ShowCountry", sender: nil)
        
    }
    
    @IBAction func favButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "showMe",sender: nil)
    }
    
    
    @IBAction func ExButton1(_ sender: UIButton) {
    }
    
    
    @IBAction func exButton2(_ sender: UIButton) {
    }
    
    
    @IBAction func quizButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "showQuiz", sender: nil)
        
    }
    
    @IBAction func gameButton(_ sender: UIButton) {
        
    
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "backToHm", sender: nil)
    }

    
    
    func splitData(){
        
        print(InfoDataArray.count)
        
        cntryIndexRef = 0
        
        for eachFetchedCountry in InfoDataArray{
            
            let continent = eachFetchedCountry.continent
            let subregion = eachFetchedCountry.subregion
            let cntryCode = eachFetchedCountry.code
            let languages: [String] = eachFetchedCountry.languages  //Array
            let currencies: [String] = eachFetchedCountry.currencies  //Array
            
            
            
            //Genearting and Storing Flags from country codes
            var s: String = emojiFlagGen(countryCode: cntryCode)
        //    print(s)
            flagEmojiArray.append(s)
            var flagImg = s.image()
            flagImgArray.append(flagImg)
            
            //languages
        //    print(languages)
            
            var tempLang = [String]()
            var tempCurr = [String]()
            
            for languageCode in languages{
                
                // Returns Language name from the code
                
                let lang = "en"
                let locale = NSLocale(localeIdentifier: lang)
                let translated = locale.displayName(forKey: NSLocale.Key.identifier, value: languageCode)!
            //    print("\(lang) \(translated)")
                tempLang.append(translated)
                
            }
            
         //   print(currencies)
            
            for currencyCode in currencies{
                
                //Returns currency code
                
                //  let currencyCode = "BDT"
                let currLocale = NSLocale(localeIdentifier: currencyCode)
                let code = currLocale.currencyCode
                let currency = currLocale.localizedString(forCurrencyCode: currencyCode)
                tempCurr.append(currency!)
              //  print("Currency: \(currency)")
                
            }
            
            langNCurrArray.append(langNCurrencyStruct(languages: tempLang, currencies: tempCurr))
            
            
            var retCont = checkContinents(continent: continent, subregion: subregion)
            
            if retCont == 1 {
                asiaDetail.append(eachFetchedCountry)
                asiaDetailRef.append(cntryIndexRef)
                print(cntryIndexRef)
                
                regionInfoArray.append(regionInfoStruct(region: continent, subregion: subregion, regName: "Asia"))
                
               
                
            }
            else if retCont == 2{
                
                europeDetail.append(eachFetchedCountry)
                europeDetailRef.append(cntryIndexRef)
                regionInfoArray.append(regionInfoStruct(region: continent, subregion: subregion, regName: "Europe"))

                
            }
                
            else if retCont == 3{
                
                australiaDetail.append(eachFetchedCountry)
                australiaDetailRef.append(cntryIndexRef)
                
                
                if subregion == "Australia and New Zealand"{
                    
                    regionInfoArray.append(regionInfoStruct(region: continent, subregion: subregion, regName: "Australia"))

                    
                }
                else{
                    
                    regionInfoArray.append(regionInfoStruct(region: continent, subregion: subregion, regName: "Oceania"))

                    
                }
                
            }
                
            else if retCont == 4{
                
                northAmericaDetail.append(eachFetchedCountry)
                northAmericaDetailRef.append(cntryIndexRef)
                
                regionInfoArray.append(regionInfoStruct(region: continent, subregion: subregion, regName: "North America"))
                
            }
                
            else if retCont == 5{
                
                southAmericaDetail.append(eachFetchedCountry)
                southAmericaDetailRef.append(cntryIndexRef)
                
                regionInfoArray.append(regionInfoStruct(region: continent, subregion: subregion, regName: "South America"))

            }
                
            else if retCont == 6{
                
                othersAmericaDetail.append(eachFetchedCountry)
                othersAmericaDetailRef.append(cntryIndexRef)
                
                
                if subregion == "Caribbean"{
                    
                    regionInfoArray.append(regionInfoStruct(region: continent, subregion: subregion, regName: "Caribbean"))
                    
                }
                else{  //"Central America"
                    
                    regionInfoArray.append(regionInfoStruct(region: continent, subregion: subregion, regName: "Central America"))
                    
                }
                            }
                
            else if retCont == 7{
                
                africaDetail.append(eachFetchedCountry)
                africaDetailRef.append(cntryIndexRef)
                
                regionInfoArray.append(regionInfoStruct(region: continent, subregion: subregion, regName: "Africa"))
            }
                
            else{  //Polar
                
                othersDetail.append(eachFetchedCountry)
                othersDetailRef.append(cntryIndexRef)
                
                regionInfoArray.append(regionInfoStruct(region: continent, subregion: subregion, regName: "Antarctica"))

            }
            
            cntryIndexRef = cntryIndexRef + 1
            
        }
        
        print("AsiaTestRef \(asiaDetailRef.count)")
        print("EuropeTest \(europeDetailRef.count)")
        print("NATest \(northAmericaDetailRef.count)")
        print("SATest \(southAmericaDetailRef.count)")
        print("OthersamericaTest \(othersAmericaDetailRef.count)")
        print("AfricaTest \(africaDetailRef.count)")
        print("AfricaTest \(australiaDetailRef.count)")
        print("OtherTest \(othersDetailRef.count)")
        print("LangNCurr \(langNCurrArray.count)")
        
        

    }
    
    
    
    
    func checkContinents(continent: String, subregion: String)-> Int{
        
        if  continent == "Asia"{
            print("Asia:")
            
            
            return 1
            
        }
            
        else if  continent == "Europe"{
            
            print("Europe:")
            return 2
            
        }
            
            
        else if continent == "Oceania"{
            
            return 3
        }
        else if continent == "Americas"{
            
            if subregion == "Northern America"{
                return 4
            }
            else if subregion == "South America"{
                return 5
            }
            else{
                return 6
            }
            
        }
        else if continent == "Africa"{
            
            return 7
        }
            
        else {
            
            return 8
            
        }
        
    }
    
    func emojiFlagGen(countryCode countryCode: String) -> String {
        var s  = ""
        let base: UInt32 = 127397
        var country = countryCode.uppercased()
        for v in country.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
    
}

extension String {
    func image() -> UIImage {
        let size = CGSize(width: 20, height: 15)
        UIGraphicsBeginImageContextWithOptions(size, false, 0);
        UIColor.white.set()
        let pointZero = CGPoint(x: 0, y:0)
        let rect = CGRect(x:0, y:0, width:20, height: 50)
        UIRectFill(CGRect(origin: pointZero, size: size))
        (self as NSString).draw(in: rect, withAttributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}


