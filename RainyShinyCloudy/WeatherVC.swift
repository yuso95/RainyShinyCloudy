//
//  WeatherVC.swift
//  RainyShinyCloudy
//
//  Created by Younoussa Ousmane Abdou on 12/18/16.
//  Copyright © 2016 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Variables and Constants
    var currentWeather = CurrentWeather()
    
    // Outlets
    @IBOutlet weak var dateLBL: UILabel!
    @IBOutlet weak var currentTempLBL: UILabel!
    @IBOutlet weak var locationLBL: UILabel!
    @IBOutlet weak var currentWeatherIMG: UIImageView!
    @IBOutlet weak var currentWeatherType: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // Actions

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather.downloadWeatherDetail {
            // Setup the UI later
        }
    }
    
    // TableView Functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
}

