//
//  WeatherCell.swift
//  RainyShinyCloudy
//
//  Created by Younoussa Ousmane Abdou on 12/22/16.
//  Copyright © 2016 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var imageThumbIMG: UIImageView!
    @IBOutlet weak var dateLBL: UILabel!
    @IBOutlet weak var weatherTypeLBL: UILabel!
    @IBOutlet weak var lowTempLBL: UILabel!
    @IBOutlet weak var highTempLBL: UILabel!
    
    func configureCell(forecast: Forecast) {
        
        dateLBL.text = forecast.date
        weatherTypeLBL.text = forecast.weatherTpe
        lowTempLBL.text = forecast.lowTemp
        highTempLBL.text = forecast.highTemp
        imageThumbIMG.image = UIImage(named: forecast.weatherTpe)
    }

}
