//
//  Forecast.swift
//  WeatherReport
//
//  Created by Raju on 17/02/18.
//  Copyright © 2018 Ammaiappan. All rights reserved.
//

import UIKit
import RealmSwift

class Forecast: Object {
    @objc dynamic var date: Date?
    @objc dynamic var atmosphere: Atmosphere?
    @objc dynamic var weather: Weather?
    @objc dynamic var clouds: Double = 0.0
}




