//
//  Weather.swift
//  WeatherReport
//
//  Created by Raju on 17/02/18.
//  Copyright © 2018 Ammaiappan. All rights reserved.
//

import UIKit
import RealmSwift

class Weather: Object {
    @objc dynamic var id: Int = -1
    @objc dynamic var main: String?
    @objc dynamic var weatherDescription: String?
}

