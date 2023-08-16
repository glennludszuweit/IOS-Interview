//
//  WeatherView.swift
//  Weather
//
//  Created by Glenn Ludszuweit on 15/08/2023.
//

import SwiftUI

struct WeatherView: View {
    var weekWeatherForecast: [Daily] = []
    
    var body: some View {
        if weekWeatherForecast.count > 0 {
            VStack {
                List(weekWeatherForecast, id: \.time) { weather in
                    HStack {
                        Text(weather.time)
                        Text(String(weather.values.temperatureAvg))
                    }
                }
            }
            Spacer()
        } else {
            ProgressView("Fetching Weather")
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
