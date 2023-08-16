//
//  HomeView.swift
//  Weather
//
//  Created by Glenn Ludszuweit on 15/08/2023.
//

import SwiftUI
import CoreLocation
import MapKit

struct HomeView: View {
    @StateObject var locationViewModel = LocationViewModel()
    @StateObject var weatherViewModel = WeatherViewModel(networkManager: NetworkManager(), errorManager: ErrorManager())
    @State private var location: Location?
    
    var body: some View {
        NavigationView {
            VStack {
                if let weatherForecast = weatherViewModel.weatherForecast {
                    VStack {
                        Text("Average Temperature:")
                            .fontWeight(.bold)
                        Text("\((weatherForecast.timelines.daily[0].values.temperatureAvg))")
                            .font(.title)
                            .padding(25)
                    }
                    Spacer()
                    NavigationLink {
                        WeatherView(weekWeatherForecast: weatherViewModel.weatherForecast?.timelines.daily ?? [])
                    } label: {
                        Text("This weeks Forecast")
                    }.buttonStyle(.borderedProminent)
                        .tint(.orange)
                        .padding(20)
                } else if let errorMessage = weatherViewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                } else {
                    ProgressView("Fetching Weather")
                }
                
                Spacer()
                
                Button("Fetch Weather") {
                    if (locationViewModel.currentLocation != nil) {
                        location = Location(name: "Me", coordinate: locationViewModel.currentLocation!.coordinate)
                    } else {
                        location = Location(name: "London", coordinate: CLLocation(latitude: 28.3644, longitude: 15.8352).coordinate)
                    }
                    
                    guard let location = location else { return }
                    
                    weatherViewModel.fetchWeatherForecast(lat: location.coordinate.latitude, long: location.coordinate.longitude)
                }.buttonStyle(.borderedProminent)
                    .padding(20)
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
