//
//  WetherDataService.swift
//  WeatherReport
//
//  Created by Raju on 17/02/18.
//  Copyright © 2018 Ammaiappan. All rights reserved.
//

import UIKit
import Alamofire

class WetherDataService: NSObject {
    func getForecast(city: String, contryCode: String, onCompletion completion: @escaping (_ inner: () throws -> [Forecast]) -> (Void)) {
        var parameters = [String: String]()
        parameters["appid"] = wetherAppId
        parameters["q"] = "\(city),\(contryCode)"
        let fullUrl = "\(baseUrl)/forecast"
        Alamofire.request(fullUrl, method: .get, parameters: parameters).responseJSON { (responce) in
            do {
                if let data = responce.data {
                    let dataObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                    if let dic = dataObject as? [String: AnyObject], let forcastDic = dic["list"] as? [AnyObject] {
                        let val = ForecastDeserializer.objectsFromDic(forcastDic)
                        completion({return val})
                    }
                }
            }
            catch {
                
            }
        }
    }
}
