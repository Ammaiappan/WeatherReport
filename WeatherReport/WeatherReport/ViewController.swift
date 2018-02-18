//
//  ViewController.swift
//  WeatherReport
//
//  Created by Raju on 15/02/18.
//  Copyright © 2018 Ammaiappan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func updateUI() {
        WeatherBusinessLayer().getCurrentForecast(city: "Lyon", contryCode: "FR") { (inner) -> (Void) in
            do {
                let val = try inner()
                print(val)
            } catch {
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

