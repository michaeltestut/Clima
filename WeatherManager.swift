//
//  WeatherManager.swift
//  Clima
//
//  Created by Michael Testut on 12/30/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager{
    
    let weatherURL="http://api.openweathermap.org/data/2.5/weather?appid=9baa04baa40e2233758cd10ddd091b6b&units=imperial"
    
    func fetchWeather(cityName:String){
        let urlString="\(weatherURL)&q=\(cityName)"
    }
}
