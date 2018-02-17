//
//  WeatherBusinessLayer.swift
//  WeatherReport
//
//  Created by Raju on 17/02/18.
//  Copyright © 2018 Ammaiappan. All rights reserved.
//

import UIKit

class WeatherBusinessLayer: NSObject {
    func getForecast(city: String, contryCode: String, onCompletion completion: @escaping (_ inner: () throws -> Void) -> (Void)) {
        WetherDataService().getForecast(city: city, contryCode: contryCode) { (inner: () throws -> Any) -> (Void) in
            do {
                let val = try inner()
                print(val)
            }
            catch {
                
            }
        }
    }
}
