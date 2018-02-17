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

class WindDeserializer {
    class func objectsFromDic(_ dics: AnyObject?) -> Wind {
        guard let resultDict = dics as? [String: AnyObject] else {
            return Wind()
        }
        let wind = Wind()
        wind.speed = ((resultDict["speed"] as? NSNumber)?.doubleValue) ?? 0.0
        wind.deg = ((resultDict["deg"] as? NSNumber)?.doubleValue) ?? 0.0
        return wind
    }
}
