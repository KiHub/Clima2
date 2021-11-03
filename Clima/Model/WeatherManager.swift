//
//  WeatherManager.swift
//  Clima
//
//  Created by  Mr.Ki on 01.11.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=eb719e65b35d523730afc4969386a389&units=metric"
    
    func fetchWeather(cityName: String)  {
        let urlString = "\(weatherURL)&q=\(cityName)"
        
        performReques(urlString: urlString)
    }
    
    func performReques(urlString: String)  {
        //1. Create url
        if let url = URL(string: urlString) {
            
            
            //2. Create url session
            let session = URLSession(configuration: .default)
            
            //3. Give the session task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            //4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data)  {
        let decoder = JSONDecoder()
        do {
         let decodedData = try  decoder.decode(WeatherData.self, from: weatherData)
           // print(decodedData.name)
           // print(decodedData.main.temp)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let temStr = String(format:"%.1f",decodedData.main.temp)
            
            
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp, temperatureString: temStr)
            
            
            
            
            print(weather.conditionName)
            print(weather.temperatureString)
            
        } catch {
            print(error)
        }
    }
    
    
}


