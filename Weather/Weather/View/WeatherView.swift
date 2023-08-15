//
//  WeatherView.swift
//  Weather
//
//  Created by Glenn Ludszuweit on 15/08/2023.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var weatherViewModel = WeatherViewModel(networkManager: NetworkManager(), errorManager: ErrorManager())
    
    var body: some View {
        List((weatherViewModel.weatherForecast?.timelines.daily)!, id: \.time) { weather in
            HStack {
                Text(weather.time)
                Text(String(weather.values.temperatureAvg))
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
