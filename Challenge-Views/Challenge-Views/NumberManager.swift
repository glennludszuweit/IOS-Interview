//
//  ViewModel.swift
//  Challenge-Views
//
//  Created by Glenn Ludszuweit on 28/06/2023.
//

import Foundation

class ViewModel: ObservableObject {
    static let shared = ViewModel()
    
    @Published var number1: Int = 10
    @Published var number2: Int = 20
    
    func swipeNumbers() {
        (number1, number2) = (number2, number1)
    }
}
