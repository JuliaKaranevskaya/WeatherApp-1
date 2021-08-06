//
//  WeatherService.swift
//  Weather
//
//  Created by admin on 05.08.2021.
//

import Foundation

protocol WeatherServiceDelegate {
    func setWeather(weather : Weather)
}

class WeatherService {
    
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
                
                let weather = Weather(cityName: name!, temp: temp!, description: desc!)
                
                if self.delegate != nil {
                    DispatchQueue.main.async {
                        self.delegate?.setWeather(weather: weather)
                    }
                }
            }
        }.resume()       
    }
}
