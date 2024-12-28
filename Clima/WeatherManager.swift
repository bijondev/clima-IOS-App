//
//  WeatherManager.swift
//  Clima
//
//  Created by Bijon Krishna Bairagi on 12/28/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=dc22a298c7ed1ccf1e413c84b7541f89&units=metric"
    
    func fetchWeather(CityName: String){
        let urlString = "\(weatherURL)&q=\(CityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){ (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data{
                    self.parseJSON(weatherData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.weather[0].description)
        }
        catch {
            print(error)
        }
    }
    
    
}
