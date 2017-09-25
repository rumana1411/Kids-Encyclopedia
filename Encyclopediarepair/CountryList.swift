//
//  CountryList.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 13/6/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import Foundation

class CountryList{
    
    var countryName: String!
    var countryContinent: String!
    var countryFlagName: String!
    var countryCurrency: String!
    var countryLanguage: String!
    var countryCapital: String!
    var countryLattitude: String
    var countryLongitude: String!
    
    
    init(countryName: String, countryContinent: String, countryFlagName: String, countryCurrency: String, countryLanguage: String, countryCapital: String, countryLattitude: String, countryLongitude: String){
        
        self.countryName = countryName
        self.countryContinent = countryContinent
        self.countryFlagName = countryFlagName
        self.countryCurrency = countryCurrency
        self.countryLanguage = countryLanguage
        self.countryCapital = countryCapital
        self.countryLattitude = countryLattitude
        self.countryLongitude = countryLongitude
        
    }
}
