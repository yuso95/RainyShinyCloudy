//
//  WeatherVC.swift
//  RainyShinyCloudy
//
//  Created by Younoussa Ousmane Abdou on 12/18/16.
//  Copyright © 2016 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    // Variables and Constants
    var currentWeather: CurrentWeather!
    var forecasts = [Forecast]()
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
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
    
        currentWeather = CurrentWeather()
        
        // Location Setup
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationAuthStatus()
    }
    
    // UpdateTheMainUI
    func updateTheMainUI() {
        
        dateLBL.text = currentWeather.date
        
        // Only the date is working
        currentTempLBL.text = "\(currentWeather.currentTemp)"
        locationLBL.text = currentWeather.cityName
        currentWeatherType.text = currentWeather.weatherType
        currentWeatherIMG.image = UIImage(named: currentWeather.weatherType)

    }
    
    // DownloadForecastData from OpenWeatherAPI
    
    func downloadForecastData(completed: DownloadComplete) {
        
        let currentForecastURL = URL(string: FORECAST_URL)!
        
        Alamofire.request(currentForecastURL).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {

                    for obj in list {
                        
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        
                        print(obj)
                    }
                    
                    self.forecasts.remove(at: 0)
                    self.tableView.reloadData()
                }
            }
        }
        completed()
    }
    
    // TableView Functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as? WeatherCell {
            
            let eachForecast = forecasts[indexPath.row]
            
            cell.configureCell(forecast: eachForecast)
            
            return cell
        } else {
            
            return WeatherCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    // Location Function
    
    func locationAuthStatus() {
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            
            currentLocation = locationManager.location
            
            // Change the location from Debug -> Location (None) to any you want 
            // To avoid the crash of the App which you need to delete and run after
            
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            
            // Move it because of the not set or nil if it was in viewDidLoad()
            currentWeather.downloadWeatherDetails {
                
                self.downloadForecastData {
                    
                    self.updateTheMainUI()
                }
            }

            
            // Testing
            print(currentLocation.coordinate.latitude, currentLocation.coordinate.longitude)
        } else {
            
            locationManager.requestWhenInUseAuthorization()
            
            // Repeat the function when user deny
            locationAuthStatus()
        }
    }
    
}

