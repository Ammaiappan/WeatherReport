//
//  Atmosphere.swift
//  WeatherReport
//
//  Created by Raju on 17/02/18.
//  Copyright © 2018 Ammaiappan. All rights reserved.
//

import UIKit
import RealmSwift

class Atmosphere: Object {
    @objc dynamic var temp: Double = 0.0
    @objc dynamic var minTemp: Double = 0.0
    @objc dynamic var maxTemp: Double = 0.0
    @objc dynamic var pressure: Double = 0.0
    @objc dynamic var seaLevel: Double = 0.0
    @objc dynamic var grndLevel: Double = 0.0
    @objc dynamic var humidity: Double = 0.0
    @objc dynamic var tempKf: Double = 0.0
}

