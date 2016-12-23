//
//  Constants.swift
//  RainyShinyCloudy
//
//  Created by Younoussa Ousmane Abdou on 12/19/16.
//  Copyright © 2016 Younoussa Ousmane Abdou. All rights reserved.
//

import Foundation

// For Today
let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATTITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "01b71ce9d42eae12344cd64ff899d22c"
let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATTITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(API_KEY)"

// Forscast
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&mode=json&appid=01b71ce9d42eae12344cd64ff899d22c"

typealias DownloadComplete = () -> ()
