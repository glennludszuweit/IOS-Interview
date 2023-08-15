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
        VStack {
            if let weatherForecast = weatherViewModel.weatherForecast {
                Text("\(weatherForecast.location?.lat ?? 0)")
            } else if let errorMessage = weatherViewModel.errorMessage {
                Text("Error: \(errorMessage)")
            } else {
                ProgressView("Fetching Weather")
            }
            
            Button("Fetch Weather") {
                if (locationViewModel.currentLocation != nil) {
                    location = Location(name: "Me", coordinate: locationViewModel.currentLocation!.coordinate)
                } else {
                    location = Location(name: "London", coordinate: CLLocation(latitude: 28.3644, longitude: 15.8352).coordinate)
                }
                
                guard let location = location else { return }
                
                weatherViewModel.fetchWeatherForecast(lat: location.coordinate.latitude, long: location.coordinate.longitude)
            }
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
