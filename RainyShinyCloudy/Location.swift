//
//  Location.swift
//  RainyShinyCloudy
//
//  Created by Younoussa Ousmane Abdou on 12/22/16.
//  Copyright © 2016 Younoussa Ousmane Abdou. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    
    static var sharedInstance = Location()
    
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
