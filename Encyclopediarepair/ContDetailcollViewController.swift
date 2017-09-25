//
//  ContDetailcollViewController.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 6/6/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

//https://stackoverflow.com/questions/28325277/how-to-set-cell-spacing-and-uicollectionview-uicollectionviewflowlayout-size-r

import UIKit

class ContDetailcollViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    
    
    var collectionView: UICollectionView!
    var contToShow: Int!
    var countVal: Int!
    var cont: Int!
    var continentFlag: Int!
    var flagImg = UIImage()
   
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
    
        print("From ContDetailcollViewController \(contToShow)")
        print("From ContDetailcollViewController \(flagImgArray.count)")

        
        print("AsiaTestRef \(asiaDetail.count) \(asiaDetailRef.count)")
        print("EuropeTest \(europeDetail.count) \(europeDetailRef.count)")
        print("NATest \(northAmericaDetail.count) \(northAmericaDetailRef.count)")
        print("SATest \(southAmericaDetail.count) \(southAmericaDetailRef.count)")
        print("OthersamericaTest \(othersAmericaDetail.count) \(othersAmericaDetailRef.count)")
        print("AfricaTest \(africaDetail.count) \(africaDetailRef.count)")
        print("OtherTest \(othersDetail.count) \(othersDetailRef.count)")

        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0)
        
       layout.itemSize = CGSize(width: 150, height: 150)
        //layout.itemSize = CGSize(width: screenWidth / 2, height: screenWidth / 2)
        layout.minimumInteritemSpacing = 5
        
        
       // collectionView = UICollectionView(frame: CGRect(x: 10, y: 100, width: screenWidth - 10 , height: self.view.frame.height/2), collectionViewLayout: layout)
        
         collectionView = UICollectionView(frame: CGRect(x: 10, y: 100, width: screenWidth - 10 , height: self.view.frame.height), collectionViewLayout: layout)
        
                      //OR
      //  collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        //collectionView!.collectionViewLayout = layout
        
             //OR
     //   collectionView.frame = CGRect(x: 10, y: 100, width: self.view.frame.width, height: self.view.frame.height/2)

        collectionView.dataSource = self
        collectionView.delegate = self
        
        //collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell") // Without Custom Cell
        collectionView.register(MyCustomCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        if contToShow == 0{
            
                return asiaDetail.count
        }
       else if contToShow == 1{
            
           
            return europeDetail.count
        }
        else if contToShow == 2{
            
            
            return northAmericaDetail.count
        }
        else if contToShow == 3{
          
            
            return southAmericaDetail.count
        }
        else if contToShow == 4{
        
            
            return africaDetail.count
        
        }
        
        else if contToShow == 5{
            
            
             return australiaDetail.count
            
        }
        else{
            
            
             return othersDetail.count
            
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        //  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) // Without Custom cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyCustomCell
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 5
        cell.backgroundColor = UIColor.white
        cell.myLbl.layer.borderColor = UIColor.black.cgColor
        cell.myLbl.layer.borderWidth = 2
        
       
        
        var cntryFlag: UIImage!
        var ref: Int!
        var name: String!
        
       if contToShow == 0{
            ref = asiaDetailRef[indexPath.row]
            cntryFlag = flagImgArray[ref]
            name = asiaDetail[indexPath.row].country
        }
        else if contToShow == 1 {
        
            ref = europeDetailRef[indexPath.row]
            cntryFlag = flagImgArray[ref]
            name = europeDetail[indexPath.row].country
       }
        else if contToShow == 2{
        
            ref = northAmericaDetailRef[indexPath.row]
            cntryFlag = flagImgArray[ref]
            name = northAmericaDetail[indexPath.row].country
        }
        else if contToShow == 3{
        
            ref = southAmericaDetailRef[indexPath.row]
            cntryFlag = flagImgArray[ref]
            name = southAmericaDetail[indexPath.row].country
        
        }
        else if contToShow == 4{
        
           ref = africaDetailRef[indexPath.row]
           cntryFlag = flagImgArray[ref]
           name = africaDetail[indexPath.row].country
       }
        else if contToShow == 5{
        
          ref = australiaDetailRef[indexPath.row]
          cntryFlag = flagImgArray[ref]
          name = australiaDetail[indexPath.row].country
       }
        
        else{
          ref = othersDetailRef[indexPath.row]
          cntryFlag = flagImgArray[ref]
          name = othersDetail[indexPath.row].country
        
        }
     
        
       print("Ref \(ref)")
        cell.myImgView.image = flagImgArray[ref]
        cell.myLbl?.text = name
        
        return cell
    }
    
  

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
     performSegue(withIdentifier: "showCountryDetail", sender: indexPath.row)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showCountryDetail" {
            var nextScene =  segue.destination as! CountryViewController
            nextScene.countryToShow = sender as! Int
            nextScene.contIndex = contToShow
            
            // Pass the selected object to the new view controller.
            //  if let indexPath = self.tableView.indexPathForSelectedRow {
            //    let selectedVehicle = vehicles[indexPath.row]
            //  nextScene.currentVehicle = selectedVehicle
           
        //    nextScene.nameOfContinent = countryDataArray[contToShow].countryContinent

            
        }
    }
    
    
    
    @IBAction func backButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "backToCont", sender: nil)
        
        
    }

    
}





