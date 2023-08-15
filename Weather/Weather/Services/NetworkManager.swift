//
//  NetworkManager.swift
//  Weather
//
//  Created by Glenn Ludszuweit on 15/08/2023.
//

import Foundation
import Combine

protocol NetworkProtocol {
    func getAll<T: Codable>(apiUrl: URL, type: T.Type) -> AnyPublisher<T, Error>
}

class NetworkManager: NetworkProtocol {
    func getAll<T>(apiUrl: URL, type: T.Type) -> AnyPublisher<T, Error> where T : Codable {
        return URLSession.shared.dataTaskPublisher(for: apiUrl)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      200..<300 ~= httpResponse.statusCode else {
                    throw APIError.networkError
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error -> Error in
                if let apiError = error as? APIError {
                    return apiError
                } else {
                    return APIError.decodingError
                }
            }
            .eraseToAnyPublisher()
    }
}
