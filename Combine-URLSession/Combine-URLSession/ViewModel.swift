//
//  ViewModel.swift
//  Combine-URLSession
//
//  Created by Glenn Ludszuweit on 27/06/2023.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var errorMessage: String = ""
    @Published var products: [Product] = []
    
    private var cancellable = Set<AnyCancellable>()
    
    var networkManager: NetworkProtocol
    var errorManager: ErrorProtocol
    init(networkManager: NetworkProtocol, errorManager: ErrorProtocol) {
        self.networkManager = networkManager
        self.errorManager = errorManager
    }
    
    func getAllProducts(apiUrl: String) {
        guard let url = URL(string: apiUrl) else {
            self.errorMessage = errorManager.handleError(APIError.invalidURL)
            return
        }
        
        self.networkManager.getAll(apiUrl: url, type: Products.self)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break;
                case .failure(let error):
                    self.errorMessage = self.errorManager.handleError(error)
                }
            } receiveValue: { data in
                self.products = data.products
            }
            .store(in: &cancellable)
    }
}
