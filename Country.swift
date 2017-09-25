//
//  Country.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 20/7/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import Foundation
class Country{
    
    var country: String
    var capital: String
    var continent: String
    var subregion: String
    var code: String
    var latlng = [Double]()
    var languages = [String]()
    var currencies = [String]()
    var isTicked: Bool
    
    init(country: String, capital: String, continent: String, subregion: String, code: String, latlng: [Double], languages: [String], currencies: [String], isTicked: Bool){
        
        self.country = country
        self.capital = capital
        self.continent = continent
        self.subregion = subregion
        self.code = code
        self.latlng = latlng as [Double]
        self.languages = languages as [String]
        self.currencies = currencies as [String]
        self.isTicked = isTicked
        
    }
}



