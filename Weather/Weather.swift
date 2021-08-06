//
//  Weather.swift
//  Weather
//
//  Created by admin on 05.08.2021.
//

import Foundation


struct Weather {
    
    let cityName : String
    let temp : Double
    let description : String
    
    init(cityName : String, temp : Double, description : String ) {
        self.cityName = cityName
        self.temp = temp
        self.description = description
    }
}
