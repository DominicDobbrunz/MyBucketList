//
//  WeatherView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 25.02.25.
//


import SwiftUI
import Firebase

struct WeatherView: View {
    
    @EnvironmentObject var weatherVM : WeatherVM
    @EnvironmentObject var settingViewModel: SettingViewModel
    
    var body: some View {
        ZStack {
            MeshGradientView(opacity: 0.3).ignoresSafeArea()
            
            VStack {
                
//                @Bindable var appVM = settingViewModel
                
                TextField( "Stadt", text: $settingViewModel.lastWheaterLocation)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                    .onSubmit{
                        Task{
                            await weatherVM.updateCityAndFetchWeather(city: settingViewModel.lastWheaterLocation)
                        }
                    }
                VStack {
                    let weather = weatherVM.weather
                    let iconUrl = URL(string: "https:\(weather?.current.condition.icon ?? "Icon konnte nicht geladen werden")")
                    AsyncImage(url: iconUrl) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(width: 350, height: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    Text("\(String(format: "%.2f" ,weather?.current.temp_c ?? 0)) °C")
                        .font(.largeTitle)
                }
                if let error = weatherVM.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                }
                
                //            Button("Wetter laden") {
                //                Task{
                //                    await loadWeather()
                //                }
                //            }
                //            .padding()
                //            .background(Color.blue)
                //            .foregroundColor(.white)
                //            .cornerRadius(8)
                Spacer()
            }
            .padding()
            .onAppear{
                Task {
                    await weatherVM.loadWeather(city: settingViewModel.lastWheaterLocation)
                }
            }
        }
    }
}
