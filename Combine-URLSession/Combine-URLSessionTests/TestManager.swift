//
//  TestManager.swift
//  Combine-URLSessionTests
//
//  Created by Glenn Ludszuweit on 27/06/2023.
//

import Foundation
import Combine
@testable import Combine_URLSession

class TestNetworkManager: NetworkProtocol {
    func getAll<T>(apiUrl: URL, type: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
        do {
            let bundle = Bundle(for: TestNetworkManager.self)
            guard let path = bundle.url(forResource: apiUrl.absoluteString, withExtension: "json") else {
                return Fail(error: APIError.invalidURL)
                    .eraseToAnyPublisher()
            }
            let data = try Data(contentsOf: path)
            let products = try JSONDecoder().decode(T.self, from: data)
            return Just(products)
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
