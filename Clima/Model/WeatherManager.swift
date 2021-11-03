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
            print(getConditionName(weatherId: id))
            
        } catch {
            print(error)
        }
    }
    
    func getConditionName(weatherId: Int) -> String {
        var sfSubol = ""
        
        switch weatherId {
        case 200..<300:
       //     print("UIImage(systemName: "􀇒")")
           // print("􀇒")
            sfSubol = "􀇒"
        case 300..<500:
           // print("􀇄")
            sfSubol = "􀇄"
        case 500..<600:
           // print("􀇆")
            sfSubol = "􀇆"
        case 600..<700:
           // print("􀇎")
            sfSubol = "􀇎"
        case 700..<799:
          //  print("􀇧")
            sfSubol = "􀇧"
        case 800:
          //  print("􀆭")
            sfSubol = "􀆭"
        default:
         //   print("􀇂")
            sfSubol = "􀇂"
        }
        return sfSubol
    }
}


