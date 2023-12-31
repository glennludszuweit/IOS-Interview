//
//  TestManager.swift
//  WeatherTests
//
//  Created by Glenn Ludszuweit on 15/08/2023.
//

import Foundation
import Combine
@testable import Weather

class TestNetworkManager: NetworkProtocol {
    var shouldFail = false
    
    func getAll<T>(apiUrl: URL, type: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
        do {
            let bundle = Bundle(for: TestNetworkManager.self)
            guard let path = bundle.url(forResource: apiUrl.absoluteString, withExtension: "json") else {
                return Fail(error: APIError.invalidURL)
                    .eraseToAnyPublisher()
            }
            let data = try Data(contentsOf: path)
            let planetList = try JSONDecoder().decode(T.self, from: data)
            return Just(planetList)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: APIError.networkError)
                .eraseToAnyPublisher()
        }
    }
}

class TestErrorManager: ErrorProtocol {
    func handleError(_ error: Error) -> String {
        return error.localizedDescription
    }
}
