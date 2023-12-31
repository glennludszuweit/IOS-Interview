//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Glenn Ludszuweit on 15/08/2023.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    @Published var weatherForecast: Weather?
    @Published var errorMessage: String?
    
    private var cancellable = Set<AnyCancellable>()
    var networkManager: NetworkProtocol
    var errorManager: ErrorProtocol
    
    init(networkManager: NetworkProtocol, errorManager: ErrorProtocol) {
        self.networkManager = networkManager
        self.errorManager = errorManager
    }
    
    func fetchWeatherForecast(lat: Double, long: Double) {
        let location = "\(lat),\(long)"
        guard let url = URL(string: "\(APIServices.weeatherAPI)&location=\(location)&apikey=\(APIServices.tomorrowAPIKey)") else {
            self.errorMessage = errorManager.handleError(APIError.invalidURL)
            return
        }
        
        self.networkManager.getAll(apiUrl: url, type: Weather.self)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    print("success")
                    break
                case .failure(let error):
                    print("failed")
                    self?.errorMessage = self?.errorManager.handleError(error)
                }
            } receiveValue: { [weak self] data in
                print(data)
                self?.weatherForecast = data
            }
            .store(in: &cancellable)
    }
}
