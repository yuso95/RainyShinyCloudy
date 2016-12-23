//
//  CurrentWeather.swift
//  RainyShinyCloudy
//
//  Created by Younoussa Ousmane Abdou on 12/19/16.
//  Copyright © 2016 Younoussa Ousmane Abdou. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeather {
    
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var cityName: String {
        
        if _cityName == nil {
            
            _cityName = ""
        }
        
        return _cityName
    }
    
    var date: String {
        
        if _date == nil {
            
            _date = ""
        }
        
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .long
        dateFormater.timeStyle = .none
        
        let currentDate = dateFormater.string(from: Date())
        self._date = "Today \(currentDate)"
        
        return _date
    }
    
    var weatherType: String {
        
        if _weatherType == nil {
            
            _weatherType = ""
        }
        
        return _weatherType
    }
    
    var currentTemp: Double {
        
        if _currentTemp == nil {
            
            _currentTemp = 0.0
        }
        
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: DownloadComplete) {
        
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        
        Alamofire.request(currentWeatherURL).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    
                    self._cityName = name.capitalized
                    
                    print(self.cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    
                    if let main = weather[0]["main"] as? String {
                        
                        self._weatherType = main.capitalized
                        
                        print(self.weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    
                    if let currentTemp = main["temp"] as? Double {
                        
                        let kelvinToFarhenheitPreDivision = (currentTemp * (9/5) - 459.67)
                        let kelvinToFarhenheit = Double(round(10 * kelvinToFarhenheitPreDivision / 10))
                        
                        self._currentTemp = kelvinToFarhenheit
                        
                        print(self.currentTemp)
                    }
                }
            }
            
        }
        
        completed()
    }
}
