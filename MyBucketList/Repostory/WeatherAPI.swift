//
//  WeatherAPI.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 25.02.25.
//


import Foundation

class WeatherAPI {
    var city: String
    
    init(city: String) {
        self.city = city
    }
    
    func fetchWeather() async throws -> WeatherResponse {
        let key = "75551be6ab8d497fbeb130927252502"
        let urlString = "https://api.weatherapi.com/v1/forecast.json?key=\(key)&q=\(city)&days=3" // Forecast für 3 Tage

        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
        return weatherResponse
    }
}
