//
//  HomeView.swift
//  Combine-URLSession
//
//  Created by Glenn Ludszuweit on 27/06/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel(networkManager: NetworkManager(), errorManager: ErrorManager())
    
    var body: some View {
        NavigationStack {
            List(viewModel.products, id: \.id) { product in
                if let title = product.title {
                    Text(title).listStyle(.plain)
                } else {
                    Text(viewModel.errorMessage)
                }
            }.navigationTitle("Products")
        }
        .onAppear {
            viewModel.getAllProducts(apiUrl: "https://dummyjson.com/products")
        }
        .refreshable {
            viewModel.getAllProducts(apiUrl: "https://dummyjson.com/products")
        }
    }
}

struct PlanetListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

