//
//  SecondView.swift
//  Challenge-Views
//
//  Created by Glenn Ludszuweit on 28/06/2023.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var swapViewModel: SwapViewModel
    
    var body: some View {
        Button(action: {
            swapViewModel.swapeNumbersAndColor()
        }) {
            Text("Swap Numbers")
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
