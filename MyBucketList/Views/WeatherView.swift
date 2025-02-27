//
//  WeatherView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 25.02.25.
//


import SwiftUI
import Firebase

struct WeatherView: View {
    
    @StateObject private var weatherVM = WeatherVM()
    //@EnvironmentObject var settingViewModel: SettingViewModel
    var item: BucketListItem
    
    var body: some View {
        if let weather = weatherVM.weather {
                      VStack {
                          Text("Wettervorhersage für \(weather.location.name)")
                              .font(.headline)
                              .foregroundStyle(.black)
                          
                          ForEach(weather.forecast.forecastday, id: \.date) { day in
                              HStack {
                                  AsyncImage(url: URL(string: "https:\(day.day.condition.icon)")) { image in
                                      image.resizable()
                                          .frame(width: 40, height: 40)
                                  } placeholder: {
                                      ProgressView()
                                  }
                                  
                                  Text(day.date)
                                      .font(.subheadline)
                                      .foregroundStyle(.black)
                                  
                                  Spacer()
                                  
                                  Text("\(Int(day.day.maxtemp_c))°C / \(Int(day.day.mintemp_c))°C")
                                      .foregroundStyle(.black)
                              }
                              //.padding()
                          }
                      }
                      .padding()
        } else {
            ProgressView()
                .onAppear {
                    Task {
                        await weatherVM.loadWeather(city: item.location) // Wetter für den Ort holen
                    }
                }
        }
    }
}

#Preview {
    WeatherView(item: BucketListItem(title: "Wandern", country: "Deutschland", location: "Harz", companion: .partner))
        .environmentObject(WeatherVM())
}
