//
//  WeatherData.swift
//  Clima
//
//  Created by Bijon Krishna Bairagi on 12/28/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData : Decodable{
    let name : String
    let main: Main
    let weather : [Weather]
}

struct Weather : Decodable{
    let id: Int
    let main : String
    let description : String
    let icon : String
}

struct Main : Decodable{
    let temp : Double
    let feels_like : Double
    let temp_min : Double
    let temp_max : Double
    let pressure : Double
    let humidity : Double
    let sea_level : Double
    let grnd_level : Double
}
