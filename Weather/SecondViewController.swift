//
//  SecondViewController.swift
//  Weather
//
//  Created by admin on 04.08.2021.
//

import UIKit

class SecondViewController: UIViewController {
   
    
    

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var degreesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    
    var cityName = ""
    var cityTemp = ""
    var cityDesc = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       cityLabel.text = cityName
       // degreesLabel.text = cityTemp
      //descriptionLabel.text = cityDesc
        
        
    }

   
}
