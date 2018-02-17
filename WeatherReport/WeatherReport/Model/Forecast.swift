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
    @objc dynamic var wind: Wind?
    @objc dynamic var clouds: Double = 0.0
}

class ForecastDeserializer {
    class func objectsFromDic(_ dics: [AnyObject]?) -> [Forecast] {
        guard let resultDicts = dics as? [[String: AnyObject]] else {
            return []
        }
        var forecasts: [Forecast] = []
        for resultDict in resultDicts {
            let forecast = Forecast()
            if let unixDate = (resultDict["dt"] as? NSNumber)?.doubleValue {
                forecast.date = Date(timeIntervalSince1970: unixDate)
            }
            if let clouds = resultDict["clouds"] as? [String: NSNumber] {
                forecast.clouds = clouds["all"]?.doubleValue ?? 0.0
            }
            forecast.atmosphere = AtmosphereDeserializer.objectsFromDic(resultDict["main"])
            forecast.weather = WeatherDeserializer.objectsFromDic(resultDict["weather"])
            forecast.wind = WindDeserializer.objectsFromDic(resultDict["wind"])
            forecasts.append(forecast)
        }
        return forecasts
    }
}
