//
//  Forecast.swift
//  RainyShinyCloudy
//
//  Created by Younoussa Ousmane Abdou on 12/21/16.
//  Copyright © 2016 Younoussa Ousmane Abdou. All rights reserved.
//

import Foundation
import Alamofire

class Forecast {
    
    var _date: String!
    var _weahterType: String!
    var _lowTemp: String!
    var _highTemp: String!
    
    var date: String {
        
        if _date == nil {
            
            _date = ""
        }
        
        return _date
    }
    
    var weatherTpe: String {
        
        if _weahterType == nil {
            
            _weahterType = ""
        }
        
        return _weahterType
    }
    
    var lowTemp: String {
        
        if _lowTemp == nil {
            
            _lowTemp = ""
        }
        
        return _lowTemp
    }
    
    var highTemp: String {
        
        if _highTemp == nil {
            
            _highTemp = ""
        }
        
        return _highTemp
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            
            if let min = temp["min"] as? Double {
                
                let kelvinToFarhenheitPreDivision = (min * (9/5) - 459.67)
                let kelvinToFarhenheit = Double(round(10 * kelvinToFarhenheitPreDivision / 10))
                
                self._lowTemp = String(kelvinToFarhenheit)
            }
            
            if let max = temp["max"] as? Double {
                
                let kelvinToFarhenheitPreDivision = (max * (9/5) - 459.67)
                let kelvinToFarhenheit = Double(round(10 * kelvinToFarhenheitPreDivision / 10))
                
                self._highTemp = String(kelvinToFarhenheit)
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            
            if let main = weather[0]["main"] as? String {
                
                self._weahterType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.timeStyle = .none
            dateFormatter.dateFormat = "EEEE"
            self._date = unixConvertedDate.dayOfTheWeek()
        }
    }
}

extension Date {
    
    func dayOfTheWeek() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
