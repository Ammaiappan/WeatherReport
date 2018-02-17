//
//  Wind.swift
//  WeatherReport
//
//  Created by Raju on 17/02/18.
//  Copyright © 2018 Ammaiappan. All rights reserved.
//

import UIKit
import RealmSwift

class Wind: Object {
    @objc dynamic var speed: Double = 0.0
    @objc dynamic var deg: Double = 0.0
}

