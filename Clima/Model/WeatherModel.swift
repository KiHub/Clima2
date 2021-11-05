//
//  WeatherModel.swift
//  Clima
//
//  Created by  Mr.Ki on 03.11.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation


struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String
    {
        return String(format:"%.1f",temperature)
        
        
        
    }
    
    
    var conditionName: String {
        
        switch conditionId {
        case 200..<300:
      
            return "cloud.bolt"
        case 300..<500:
 
            return "cloud.drizzle"
        case 500..<600:
         
            return "cloud.rain"
        case 600..<700:
     
            return "cloud.snow"
        case 700..<799:

            return "cloud.bolt"
        case 800:
       
            return "tornado"
        default:
     
            return "cloud"
        }
    }
    
    
    func getConditionName(weatherId: Int) -> String {
       
        switch weatherId {
        case 200..<300:
      
            return "􀇒"
        case 300..<500:
 
            return "􀇄"
        case 500..<600:
         
            return "􀇆"
        case 600..<700:
     
            return "􀇎"
        case 700..<799:

            return "􀇧"
        case 800:
       
            return "􀆭"
        default:
     
            return "􀇂"
        }
        
    }
    
    
    
    
    
}
