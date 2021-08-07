//
//  ViewController.swift
//  Weather
//
//  Created by admin on 04.08.2021.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate, WeatherServiceDelegate {

    @IBOutlet weak var enterData: UITextField!
    @IBOutlet weak var checkBtn: UIButton!
    
    var locationManager : CLLocationManager!
    let weatherService = WeatherService()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.weatherService.delegate = self
        enterData.delegate = self
        checkBtn.isEnabled = false
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
    
    }

    @IBAction func myLocationBtn(_ sender: UIButton) {
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            checkBtn.isEnabled = true
            locationManager.startUpdatingLocation()
        } else {
            print("Location Not Enable")
        }
        
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    let secondVC = segue.destination as! SecondViewController
        secondVC.cityName = enterData.text!
        let cityName = enterData.text!
        self.weatherService.getWeather(city: cityName)
   }
    
    @IBAction func checkWeatherBtn(_ sender: UIButton) {
        errorMessage()
    }
    
    func setWeather(weather: Weather) {
   
    //print(weather.cityName, Float(weather.temp - 273.15), weather.description)

    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if !text.isEmpty {
                    checkBtn.isEnabled = true
                } else {
                    checkBtn.isEnabled = false
                }
                return true
            }
    func errorMessage() {
        if enterData.text == "" || enterData.text!.count < 3 {
            let alert = UIAlertController(title: "Error", message: "Something went wrong!Check your city name", preferredStyle: .alert)
            let okey = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(okey)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}
