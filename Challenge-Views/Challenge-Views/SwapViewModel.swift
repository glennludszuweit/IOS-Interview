//
//  SwapViewModel.swift
//  Challenge-Views
//
//  Created by Glenn Ludszuweit on 28/06/2023.
//

import Foundation
import SwiftUI

class SwapViewModel: ObservableObject {
    @Published var number1: Int = 1
    @Published var number2: Int = 2
    @Published var color1: Color = .green
    @Published var color2: Color = .red
    
    func swapeNumbersAndColor() {
        (number1, number2) = (number2, number1)
        (color1, color2) = (color2, color1)
    }
}
