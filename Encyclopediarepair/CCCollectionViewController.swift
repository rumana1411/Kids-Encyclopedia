//
//  CCCollectionViewController.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 24/7/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit

class CCCollectionViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    var collectionView: UICollectionView!
    var contToShow: Int!
    var countVal: Int!
    var cont: Int!
    var continentFlag: Int!
    var flagImg = UIImage()

    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            print("From ContDetailcollViewController \(contToShow)")
            
            print("AsiaTest \(asiaDetail.count)")
            print("EuropeTest \(europeDetail.count)")
            print("NATest \(northAmericaDetail.count)")
            print("SATest \(southAmericaDetail.count)")
            print("OthersamericaTest \(othersAmericaDetail.count)")
            print("AfricaTest \(africaDetail.count)")
            print("OtherTest \(othersDetail.count)")
            
            
            
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            //   layout.itemSize = CGSize(width: 90, height: 120)
            layout.itemSize = CGSize(width: 150, height: 150)
            layout.minimumInteritemSpacing = 30
            
            collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
            collectionView = UICollectionView()
            //   collectionView.frame = CGRect(x: 10, y: 100, width: self.view.frame.width, height: self.view.frame.height/2)
            
            collectionView.dataSource = self
            collectionView.delegate = self
            //     collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell") // Without Custom Cell
            collectionView.register(MyCustomCell.self, forCellWithReuseIdentifier: "Cell")
            collectionView.backgroundColor = UIColor.white
            self.view.addSubview(collectionView)
            
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return 4
       }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) // Without Custom cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyCustomCell
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 5
        cell.backgroundColor = UIColor.white
        cell.myLbl.layer.borderColor = UIColor.black.cgColor
        cell.myLbl.layer.borderWidth = 2
        
        
        
              return cell
}

}

