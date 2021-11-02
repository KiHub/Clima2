//
//  WeatherManager.swift
//  Clima
//
//  Created by  Mr.Ki on 01.11.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "http://http://api.openweathermap.org/data/2.5/weather?appid=eb719e65b35d523730afc4969386a389&units=metric"
    
    func fetchWeather(cityName: String)  {
        let urlString = "\(weatherURL)&q=\(cityName)"
        
    }
}


