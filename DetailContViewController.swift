//
//  DetailContViewController.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 31/5/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit

//var fetchedCountryArray = [Country]()


var cnt: Int = 0

class DetailContViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
   
    var cntryArray = [String]()
    
    @IBOutlet weak var myTabView: UITableView!
   
    @IBOutlet weak var barView: gradiantView!
    
        var mySearchbar = UISearchBar()
        
    
        var filteredArray = [Country]()
        var isUpdating = false
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            createSearchBar()
            
            myTabView.delegate = self
            myTabView.dataSource = self
            
            //To hide the status bar
            
            var prefersStatusBarHidden: Bool {
                return true
            }
            
            print("From Detail \(InfoDataArray.count) \(totalCntry)")
            
            
          //  parseJson()
            
            myTabView.reloadData()
            

        }
        
        
        public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            
            if isUpdating == false{
                
                return InfoDataArray.count
            }
            else{
                return filteredArray.count
            }
            
        }
        
        
        
        public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            
           
            let cell = myTabView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
            if isUpdating == false{
                cell.textLabel?.text = InfoDataArray[indexPath.row].country
                if InfoDataArray[indexPath.row].isTicked == true{
                    cell.accessoryType = UITableViewCellAccessoryType.checkmark
                }
                else{
                    cell.accessoryType =  UITableViewCellAccessoryType.none
                }
                
            }
            else{
                 cell.textLabel?.text = filteredArray[indexPath.row].country
                if filteredArray[indexPath.row].isTicked == true{
                    cell.accessoryType = UITableViewCellAccessoryType.checkmark
                }
                else{
                    cell.accessoryType =  UITableViewCellAccessoryType.none
                }
            }
            
            cell.textLabel?.font = UIFont(name: "Bradley Hand", size: 24)
            cell.textLabel?.textColor = UIColor(red: 0.05, green: 0.6, blue: 0.502, alpha: 1.0)
            return cell
            
        }
        
        func createSearchBar(){
            
            isUpdating = false

       //  navigationItem.titleView = searchbar
       //  myTableView.tableHeaderView = searchbar
            
            mySearchbar.delegate = self
            
            mySearchbar.frame = CGRect(x: 0, y: 80, width: self.view.bounds.width, height: 50)
            mySearchbar.backgroundColor = UIColor.clear
          //mySearchbar.layer.position = CGPoint(x: self.view.bounds.width/2, y: 100)
           
       // add shadow
            
       // mySearchbar.layer.shadowColor = UIColor.black.cgColor
      //  mySearchbar.layer.shadowOpacity = 0.5
      //  mySearchbar.layer.masksToBounds = false
            
            // hide cancel button
            mySearchbar.showsCancelButton = false
            
            // hide bookmark button
            mySearchbar.showsBookmarkButton = false
            
            // set Default bar status.
            mySearchbar.searchBarStyle = UISearchBarStyle.default
            
            // set title
         //   mySearchbar.prompt = "Title"
            
            // set placeholder
            mySearchbar.placeholder = "Search Here"
            
            // change the color of cursol and cancel button.
            mySearchbar.tintColor = UIColor.red
            
            // hide the search result.
            mySearchbar.showsSearchResultsButton = false
            
            // add searchBar to the view.
            self.view.addSubview(mySearchbar)
            //barView.addSubview(mySearchbar)
    
            
            
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            //Original If contains sub string (Bangladesh, lebanan)
//            
//            filteredArray = cntryArray.filter({ (names: String) -> Bool in
//                return names.lowercased().range(of: searchText.lowercased()) != nil
//            })
            
            
            //https://stackoverflow.com/questions/31329568/swift-check-if-a-string-exists-in-an-array-case-insensitively matches only first character
            
            filteredArray = InfoDataArray.filter() {
                //return $0.country.characters.first == searchText.characters.first || $0.lowercased().characters.first == searchText.lowercased().characters.first
                
                return $0.country.lowercased().characters.first == searchText.lowercased().characters.first

            }
            
          //  filteredArray = filteredArray.filter({ (names: String) -> Bool in
           //                    return names.lowercased().range(of: searchText.lowercased()) != nil
             //               })
    
            filteredArray = filteredArray.filter(){
                return $0.country.lowercased().range(of: searchText.lowercased()) != nil
            }
    
    
            if searchText != ""{
                isUpdating = true
            }
            else{
                isUpdating = false
            }
            
            myTabView.reloadData()
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            
            mySearchbar.endEditing(true)
        }
    
    
    func findIndexInActualObjectArray(itemToRemove: String)->Int
    {
 //        InfoDataArray         filteredArray
        
        for i in 0..<InfoDataArray.count{
        
            if InfoDataArray[i].country == itemToRemove{
                return i
            }
        }
        
        return -1
        
    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
           
           
            var itemToRemove: String!
            var indexToWork = indexPath
            
            if (isUpdating)
            {
                itemToRemove = filteredArray[indexPath.row].country
                indexToWork.row = findIndexInActualObjectArray(itemToRemove:itemToRemove)
            }
            else{
                itemToRemove = InfoDataArray[indexPath.row].country
               
            }
            print ("\(itemToRemove)")
            
            if InfoDataArray[indexToWork.row].isTicked == true{
                // remove the tick from the current view
                myTabView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
                
                InfoDataArray[indexToWork.row].isTicked = false
                
                if let index = findIndex(index: indexToWork.row) {
                    myFav.remove(at: index)
                    cnt = cnt - 1
                    print("Remove: My Favourite: \(myFav.count) \(cnt)")
                    
                }
                
            }
            else{
                 myTabView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
                InfoDataArray[indexToWork.row].isTicked = true
                
                myFav.append(indexPath.row)
                cnt = cnt + 1
                myFavRefArray.append(indexPath.row)
                
                
            }
            
            /*
             if myTabView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark {
    
            
           
                 myTabView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
               
                if let index = findIndex(index: indexPath.row) {
                    myFav.remove(at: index)
                    cnt = cnt - 1
                     print("Remove: My Favourite: \(myFav.count) \(cnt)")
                    
                }
             
                
            }
            
            else{
                
                myTabView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
                print("Test: \(InfoDataArray[indexPath.row].country)")
                myFav.append(indexPath.row)
                cnt = cnt + 1
                myFavRefArray.append(indexPath.row)
            }*/
            
            
           
        }
    
    func findIndex(index: Int)-> Int!{
        
        var k: Int = 0
        
        for i in myFav{
            
            if i == index{
               
                return k
            }
            
             k = k + 1
        }
        
        return 2000
        
    }
        
        
        
        override func viewDidAppear(_ animated: Bool) {
            myTabView.reloadData()
        }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "backToHm", sender: nil)
    }

//    class Country{
//        
//        var country: String
//        var capital: String
//        
//        init(country: String, capital: String){
//            
//            self.country = country
//            self.capital = capital
//            
//        }
//    }
    

}

        


