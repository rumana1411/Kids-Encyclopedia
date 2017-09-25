//
//  MapViewController.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 25/7/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var countryMapView: MKMapView!
    var lat: Double!
    var lng: Double!
    var contIndex: Int!
    var cntryToShow: Int!
    
   
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            showMap(lat: lat, lng: lng)
         //   showMap(lat: Double(lat)!, lng: Double(lng)!)
            
        }
        
        func showMap(lat: Double, lng: Double){
            
            //        let lattitude: CLLocationDegrees =  27.1750199
            //        let longitude: CLLocationDegrees = 78.0399665
            
            let lattitude: CLLocationDegrees =  CLLocationDegrees(lat)
            let longitude: CLLocationDegrees = CLLocationDegrees(lng)
            
            
            print(lattitude)
            print(longitude)
            
            let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lattitude, longitude)
            
            
            
            let latDelta: CLLocationDegrees = 0.05
            let longDelta: CLLocationDegrees = 0.05
            
            let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
            
            
            let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
            
            countryMapView.setRegion(region, animated: true)
            let myAnnotation = MKPointAnnotation()
            
            myAnnotation.coordinate = location
            myAnnotation.title = "Taj Mahal"
            myAnnotation.subtitle = "Come and Visit me Here"
            countryMapView.addAnnotation(myAnnotation)
            
        }
    
    @IBAction func backButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "backToCntryView", sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        if segue.identifier == "backToCntryView"{
            
            var prevScene = segue.destination as! CountryViewController
            prevScene.contIndex = self.contIndex
            prevScene.countryToShow = self.cntryToShow
            
        }
    }

}
