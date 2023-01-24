//
//  WeatherData.swift
//  weatherApp
//
//  Created by poonam mittal on 24/01/23.
//

import Foundation

struct WeatherData:Codable {
    let location: LocationData
    let current: CurrentData
    
}
