//
//  WeatherBusinessLayer.swift
//  WeatherReport
//
//  Created by Raju on 17/02/18.
//  Copyright © 2018 Ammaiappan. All rights reserved.
//

import UIKit
import RealmSwift

class WeatherBusinessLayer: NSObject {
    func syncForecast(city: String, contryCode: String, onCompletion completion: @escaping (_ inner: () throws -> Void) -> (Void)) {
        WetherDataService().getForecast(city: city, contryCode: contryCode) { (inner: () throws -> [Forecast]) -> (Void) in
            do {
                let forecasts = try inner()
                DispatchQueue(label: "background").async {
                    autoreleasepool {
                        let realm = try! Realm()
                        try! realm.write {
                            realm.deleteAll()
                            realm.add(forecasts)
                            completion({ })
                        }
                    }
                }
            }
            catch {
                
            }
        }
    }
    
    func getCurrentForecast(city: String, contryCode: String) -> Forecast? {
        let realm = try! Realm()
        let vals = realm.objects(Forecast.self).filter({ $0.date! <= Date(timeIntervalSinceNow: 10800) && $0.date! >= Date(timeIntervalSinceNow: -10800) })
        return vals.first
    }
}
