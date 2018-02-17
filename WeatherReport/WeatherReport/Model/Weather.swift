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

class WeatherDeserializer {
    class func objectsFromDic(_ dics: AnyObject?) -> Weather {
        guard let resultDicts = dics as? [[String: AnyObject]], let resultDict = resultDicts.first else {
            return Weather()
        }
        let weather = Weather()
        weather.id = ((resultDict["id"] as? NSNumber)?.intValue) ?? 0
        weather.main = resultDict["main"] as? String
        weather.weatherDescription = resultDict["deg"] as? String
        return weather
    }
}
