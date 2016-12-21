//
//  Constants.swift
//  RainyShinyCloudy
//
//  Created by Younoussa Ousmane Abdou on 12/19/16.
//  Copyright © 2016 Younoussa Ousmane Abdou. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATTITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "01b71ce9d42eae12344cd64ff899d22c"
let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATTITUDE)35\(LONGITUDE)139\(APP_ID)\(API_KEY)"

typealias DownloadComplete = () -> ()
