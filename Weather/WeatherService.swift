//
//  WeatherService.swift
//  Weather
//
//  Created by admin on 05.08.2021.
//

import Foundation
import UIKit

protocol WeatherServiceDelegate {
    func setWeather(weather : Weather)
    func errorMessage()
}

class WeatherService : UIViewController {
    
    var delegate : WeatherServiceDelegate?
    
    func getWeather(city : String) {
        
        let cityEscaped = city.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)
        
        let path = "https://api.openweathermap.org/data/2.5/weather?q=\(cityEscaped!)&appid=506414b7be32a82a707849dadd269192"
        let url = URL(string: path)
        let session = URLSession.shared.dataTask(with: url!) { data, urlResponse, error in
            do {
                let json = try! JSON(data: data!)
                let temp = json["main"]["temp"].double
                let name = json["name"].string
                let desc = json["weather"][0]["description"].string
                
                guard name == cityEscaped else { return self.checkName()}
                guard temp != nil else { return }
                guard desc != nil else { return }
                let weather = Weather(cityName: name!, temp: temp!, description: desc!)
                
                if self.delegate != nil {
                    DispatchQueue.main.async {
                        self.delegate?.setWeather(weather: weather)
                    }
                }
            }
        }.resume()       
    }
    
    func checkName() {
        
        let alert = UIAlertController(title: "Error", message: "Check your city name", preferredStyle: .alert)
        let okey = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alert.addAction(okey)
        self.present(alert, animated: true, completion: nil)
    }
}


