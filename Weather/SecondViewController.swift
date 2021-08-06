//
//  SecondViewController.swift
//  Weather
//
//  Created by admin on 04.08.2021.
//

import UIKit

class SecondViewController: UIViewController, WeatherServiceDelegate {
    
    
   

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var degreesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    let weatherService = WeatherService()
    var cityName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.weatherService.delegate = self
        self.weatherService.getWeather(city: cityName)
        
    }
    func setWeather(weather: Weather) {
   
        cityLabel.text = weather.cityName
        degreesLabel.text = String(Int(weather.temp - 273.15))
        descriptionLabel.text = weather.description

    }
}
