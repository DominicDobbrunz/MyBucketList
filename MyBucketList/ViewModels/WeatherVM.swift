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
    @Published var weather: WeatherResponse?
    @Published var errorMessage: String?

    func loadWeather(city: String) async {
        let weatherAPI = WeatherAPI(city: city)
        do {
            let fetchedWeather = try await weatherAPI.fetchWeather()
            DispatchQueue.main.async {
                self.weather = fetchedWeather
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
        }
    }
}

