//
//  WeatherManager.swift
//  Clima
//
//  Created by Michael Testut on 12/30/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager{
    
    let weatherURL="https://api.openweathermap.org/data/2.5/weather?appid=9baa04baa40e2233758cd10ddd091b6b&units=imperial"
    
    func fetchWeather(cityName:String){
        let urlString="\(weatherURL)&q=\(cityName)"
    }
    
    func performRequest(urlString:String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error!)
                    return
                    
                }
                if let safeData = data{
                    let dataString=String(data: safeData, encoding: .utf8)
                }
            }
            task.resume()
        }
    }
    
}
