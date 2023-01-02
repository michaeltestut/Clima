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
        performRequest(urlString: urlString)
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
                    parseJSON(weatherData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData:Data){
        let decoder = JSONDecoder()
        do{
            let decodedData=try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.name)
            print(decodedData.main.temp)
            print(decodedData.weather[0].description)
            let id=decodedData.weather[0].id
            getConditionName(weatherId: id)
        } catch{
            print(error)
        }
    }
    func getConditionName(weatherId:Int)->String{
        switch weatherId {
                case 200...232:
                    return "cloud.bolt"
                case 300...321:
                    return "cloud.drizzle"
                case 500...531:
                    return "cloud.rain"
                case 600...622:
                    return "cloud.snow"
                case 701...781:
                    return "cloud.fog"
                case 800:
                    return "sun.max"
                case 801...804:
                    return "cloud.bolt"
                default:
                    return "cloud"
                }
    }
}
