//
//  WeatherResponse.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 25.02.25.
//
import Foundation

struct WeatherResponse: Codable {
    struct Location: Codable {
        let name: String
        let region: String
        let country: String
        let lat: Double
        let lon: Double
        let tz_id: String
        let localtime_epoch: Int
        let localtime: String
    }

    struct Condition: Codable {
        let text: String
        let icon: String
        let code: Int
    }

    struct Current: Codable {
        let last_updated_epoch: Int
        let last_updated: String
        let temp_c: Double
        let temp_f: Double
        let is_day: Int
        let condition: Condition
        let wind_mph: Double
        let wind_kph: Double
        let wind_degree: Int
        let wind_dir: String
        let pressure_mb: Double
        let pressure_in: Double
        let precip_mm: Double
        let precip_in: Double
        let humidity: Int
        let cloud: Int
        let feelslike_c: Double
        let feelslike_f: Double
        let windchill_c: Double
        let windchill_f: Double
        let heatindex_c: Double
        let heatindex_f: Double
        let dewpoint_c: Double
        let dewpoint_f: Double
        let vis_km: Double
        let vis_miles: Double
        let uv: Double
        let gust_mph: Double
        let gust_kph: Double
    }
    
    struct Forecast: Codable {
            let forecastday: [ForecastDay]
        }

        struct ForecastDay: Codable {
            let date: String
            let day: Day
        }

        struct Day: Codable {
            let maxtemp_c: Double
            let mintemp_c: Double
            let condition: Condition
        }

    let location: Location
    let current: Current
    let forecast: Forecast
}
