//
//  WeatherUITests.swift
//  WeatherUITests
//
//  Created by Юлия Караневская on 10.10.21.
//

@testable import Weather
import XCTest
import Embassy
import EnvoyAmbassador

class WeatherUITests: XCTestCase {
 
    override func setUpWithError() throws {
        
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
       
    }

    func testExample() throws {
        
        let app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()
        
        app.staticTexts["My location"].tap()
        addUIInterruptionMonitor(withDescription: "Allow “Weather” to use your location?") { (alert) -> Bool in
            let button = alert.buttons["Allow While Using App"]
            if button.exists {
                button.tap()
                return true
            }
            return false
        }
        
        app.textFields["Enter your city"].tap()
        app.textFields["Enter your city"].typeText("London")
        
        app.buttons["Check weather"].tap()
        
        let appResult = app.staticTexts["London"]
        
        XCTAssertTrue(appResult.waitForExistence(timeout: 5))
        
    }
}

  
//class MyUITests: XCTestCase, WeatherServiceProtocol {
//
//    let secondVC = SecondViewController()
//
//    override func setUpWithError() throws {
//
//        continueAfterFailure = false
//
//    }
//
//    override func tearDownWithError() throws {
//
//    }
//
//    func getWeather(city : String) {
//        let path = "http://localhost:3000/weather"
//        let url = URL(string: path)
//        let session = URLSession.shared.dataTask(with: url!) { data, urlResponse, error in
//            do {
//                let json = try? JSON(data: data ?? Data())
//                let temp = json?["main"]["temp"].double
//                let name = json?["name"].string
//                let desc = json?["weather"][0]["description"].string
//
//                let weather = Weather(cityName: name!, temp: temp!, description: desc!)
//
//                    DispatchQueue.main.async {
//                        self.secondVC.setWeather(weather: weather)
//                    }
//
//            }
//        }.resume()
//    }
//
//    func testWeather() throws {
//
//        let app = XCUIApplication()
//        app.launchArguments = ["enable-testing"]
//        app.launch()
//
//        app.textFields["Enter your city"].tap()
//        app.textFields["Enter your city"].typeText("London")
//
//        app.buttons["Check weather"].tap()
//
//        getWeather(city: "Paris")
//
//        let appResult = app.staticTexts["Paris"]
//
//        XCTAssertTrue(appResult.waitForExistence(timeout: 5))
//
//    }
//
//}
