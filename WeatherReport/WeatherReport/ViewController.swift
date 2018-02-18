//
//  ViewController.swift
//  WeatherReport
//
//  Created by Raju on 15/02/18.
//  Copyright © 2018 Ammaiappan. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class ViewController: UIViewController {

    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    var token: NotificationToken?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
        observer()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func observer() {
        let realm = try! Realm()
        token = realm.observe { (notication, relm) in
            self.updateUI()
        }
    }
    
    func updateUI() {
        if let val = WeatherBusinessLayer().getCurrentForecast(city: "Lyon", contryCode: "FR") {
            print(val)
            self.countryLabel.text = "Lyon, US"
            if let date = val.date {
                self.dateLabel.text = date.toString(dateFormat: "EEEE dd-MMM-yyyy")
            }
            self.weatherLabel.text = val.weather?.weatherDescription
            if let temp = val.atmosphere?.temp {
                self.temperatureLabel.text = String(format: "%.0f", temp - 273.15)
            }
            self.windLabel.text = "Wind: \(val.wind?.speed ?? -1) meter/sec"
            self.pressureLabel.text = "Pressure: \(val.atmosphere?.pressure ?? -1)"
            self.humidityLabel.text = "Humidity: \(val.atmosphere?.humidity ?? -1)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}
