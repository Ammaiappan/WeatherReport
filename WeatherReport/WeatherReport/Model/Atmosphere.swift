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

class AtmosphereDeserializer {
    class func objectsFromDic(_ dics: AnyObject?) -> Atmosphere {
        guard let resultDicts = dics as? [[String: AnyObject]], let resultDict = resultDicts.first else {
            return Atmosphere()
        }
        let atmosphere = Atmosphere()
        atmosphere.temp = ((resultDict["temp"] as? NSNumber)?.doubleValue) ?? 0.0
        atmosphere.minTemp = ((resultDict["temp_min"] as? NSNumber)?.doubleValue) ?? 0.0
        atmosphere.maxTemp = ((resultDict["temp_max"] as? NSNumber)?.doubleValue) ?? 0.0
        atmosphere.pressure = ((resultDict["pressure"] as? NSNumber)?.doubleValue) ?? 0.0
        atmosphere.seaLevel = ((resultDict["sea_level"] as? NSNumber)?.doubleValue) ?? 0.0
        atmosphere.grndLevel = ((resultDict["grnd_level"] as? NSNumber)?.doubleValue) ?? 0.0
        atmosphere.humidity = ((resultDict["humidity"] as? NSNumber)?.doubleValue) ?? 0.0
        atmosphere.tempKf = ((resultDict["temp_kf"] as? NSNumber)?.doubleValue) ?? 0.0
        return atmosphere
    }
}

