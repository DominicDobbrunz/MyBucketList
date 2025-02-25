//
//  WeatherVM.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 25.02.25.
//


import SwiftUI
import Observation

@MainActor

class WeatherVM: ObservableObject {
    
    var weather: WeatherResponse?
    var errorMessage: String?
    
    init(weather: WeatherResponse? = nil, errorMessage: String? = nil) {
        
        self.weather = weather
        self.errorMessage = errorMessage
    }
    
    func loadWeather(city:String) async{
        let weatherAPI = WeatherAPI(city: city)
        do {
            let fetchedWeather = try await weatherAPI.fetchWeather()
            weather = fetchedWeather
        } catch {
            errorMessage = error.localizedDescription
            
        }
    }
    
    func updateCityAndFetchWeather(city: String) async {
        await loadWeather(city: city)
    }
}
