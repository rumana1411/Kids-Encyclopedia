//
//  FavViewController.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 31/7/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit

class FavViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var myFavRef: Int!
    
    @IBOutlet weak var favTableView: UITableView!
    
    var expandedRows = Set<Int>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.favTableView.delegate = self
        self.favTableView.dataSource = self
        self.favTableView.rowHeight = UITableViewAutomaticDimension
        
        print("Flag count: \(flagImgArray.count)")
        
    }
    

    
    // TableView DataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return myFav.count
        return myFav.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     //   if indexPath.row % 4 == 0{
            
            let cell:ExtTableViewCell = favTableView.dequeueReusableCell(withIdentifier: "ExtCell") as! ExtTableViewCell
//            cell.cntryNameLbl.text = "Tap Here"
//            cell.capitalLbl.text = "\(indexPath.row)"
//            cell.currencyLbl.text = "Liza"
//            cell.languageLbl.text = "Adeepta"
        if myFavRefArray.count != 0{
            
           print("Rumana\(myFavRefArray.count)")
           print("Append: My Favourite: \(myFav.count)")
           print("Append: My FavouriteRef: \(myFavRefArray.count)")
      
            print("IndexPathRow: \(indexPath.row)")
            print(myFav)
            print("FlagImg: \(flagImgArray.count)")
            let refIndex = myFav[indexPath.row]
            print("refIndex: \(refIndex)")
            cell.flagImgView.image = flagImgArray[refIndex]
            print("Name: \(InfoDataArray[refIndex].country)")
            cell.cntryNameLbl.text = InfoDataArray[refIndex].country
            cell.capitalLbl.text = InfoDataArray[refIndex].capital
            cell.continentLbl.text = regionInfoArray[refIndex].regName
            
            //Show Language
            var lngText = ""
            for lang in langNCurrArray[refIndex].languages{
                
                if lngText.isEmpty {
                    lngText = lang
                }
                else {
                    
                    lngText += " | \(lang)"
                }
            }
            
            cell.languageLbl.text =  lngText
            
            //Show Currency
            var currencyText = ""
            for lang in langNCurrArray[refIndex].currencies{
                
                if currencyText.isEmpty {
                    currencyText = lang
                }
                else {
                    
                    currencyText += " | \(lang)"
                }
            }
            
            cell.currencyLbl.text =  currencyText
            
            
            
        }
        else{
            print("Zero")
        }

        
           //Important
        
            cell.isExpanded = self.expandedRows.contains(indexPath.row)
        
            return cell
        
//        else{
//            
//            
//            let cell:SecondTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! SecondTableViewCell
//            cell.secondLbl.text = "\(indexPath.row)"
//            return cell
//            
//        }
        

  }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 144.0
        
    }
    
        // TableView Delegate methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        guard let cell = favTableView.cellForRow(at: indexPath) as? ExtTableViewCell
            else { return }
        
        switch cell.isExpanded
        {
        case true:
            self.expandedRows.remove(indexPath.row)
        case false:
            self.expandedRows.insert(indexPath.row)
        }
        
        
        cell.isExpanded = !cell.isExpanded
        
        self.favTableView.beginUpdates()
        self.favTableView.endUpdates()
        
    }
    
    //I think it’s worth to implement one more feature. For now, to make the cell close, user has to tap  directly on this cell. To make it more user friendly, it would be good to allow tapping anywhere on other cell to roll up currently expanded one.
    //This time, whenever cell is deselected, isExpanded is set to false, instead of being set to the opposite boolean value. This prevent from situations when user closed a cell tapping on it and then selects other cell, which would result in expanding both of them.
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = favTableView.cellForRow(at: indexPath) as? ExtTableViewCell
            else { return }
        
        self.expandedRows.remove(indexPath.row)
        
        cell.isExpanded = false
        
        self.favTableView.beginUpdates()
        self.favTableView.endUpdates()
        
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "backToMenu", sender: nil)
        
    }
}



