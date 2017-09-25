//
//  ContinentsViewController.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 31/5/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit



class ContinentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var continentTableView: UITableView!
    
    @IBOutlet weak var contImgView: UIImageView!
    
//    var continents = ["Asia","Europe", "Africa","North America","South America", "Australia","Antractica"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       continentTableView.delegate = self
       continentTableView.dataSource = self
        
        
       
    }

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return contDataArray.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        var img = UIImage(named: contDataArray[indexPath.row].contImgName)
        cell.cellImgView.image = img
        cell.cellLbl.text = contDataArray[indexPath.row].contName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       print("FarhanLiza")
       performSegue(withIdentifier: "showContDetails", sender: indexPath.row)
     // performSegue(withIdentifier: "showTest", sender: indexPath.row)
        
    }
    


    @IBAction func backButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "backToHm", sender: nil)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showContDetails"{
            var nextScene = segue.destination as! ContDetailcollViewController
            nextScene.contToShow = sender as! Int

        }
            
            // Pass the selected object to the new view controller.
          //  if let indexPath = self.tableView.indexPathForSelectedRow {
            //    let selectedVehicle = vehicles[indexPath.row]
              //  nextScene.currentVehicle = selectedVehicle
            // nextScene.contToShow = sender as! Int
            
            
        }
    
    
    
    
  
    
}


