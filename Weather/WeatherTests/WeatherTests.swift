//
//  WeatherTests.swift
//  WeatherTests
//
//  Created by Glenn Ludszuweit on 15/08/2023.
//

import XCTest
import Combine
@testable import Weather

final class WeatherViewModelTests: XCTestCase {
    
    var viewModel: WeatherViewModel!
    var networkManager: TestNetworkManager!
    var errorManager: TestErrorManager!
    var cancellables: Set<AnyCancellable> = []
    
    override func setUpWithError() throws {
        networkManager = TestNetworkManager()
        errorManager = TestErrorManager()
        viewModel = WeatherViewModel(networkManager: networkManager, errorManager: errorManager)
    }
    
    override func tearDownWithError() throws {
        cancellables.forEach { $0.cancel() }
    }
    
    func testFetchWeatherForecast_Success() throws {
        // Given
        let lat = 28.3644
        let lon = 15.8352
        let expectation = XCTestExpectation(description: "Weather forecast fetched successfully")
        
        // When
        viewModel.fetchWeatherForecast(lat: lat, long: lon)
        
        // Then
        viewModel.$weatherForecast
            .sink { weather in
                XCTAssertNotNil(weather)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testFetchWeatherForecast_Failure() throws {
        // Given
        let lat = 28.3644
        let lon = 15.8352
        networkManager.shouldFail = true // Set this in your TestNetworkManager
        
        let expectation = XCTestExpectation(description: "Weather forecast fetch failed")
        
        // When
        viewModel.fetchWeatherForecast(lat: lat, long: lon)
        
        // Then
        viewModel.$errorMessage
            .sink { errorMessage in
                XCTAssertNotNil(errorMessage)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5)
    }
}
