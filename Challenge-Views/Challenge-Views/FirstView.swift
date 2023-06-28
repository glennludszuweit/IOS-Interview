//
//  FirstView.swift
//  Challenge-Views
//
//  Created by Glenn Ludszuweit on 28/06/2023.
//

import SwiftUI

struct FirstView: View {
    @EnvironmentObject var swapViewModel: SwapViewModel
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(swapViewModel.color1)
                .frame(maxWidth: .infinity)
                .overlay(Text("\(swapViewModel.number1)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white))
            
            Rectangle()
                .fill(swapViewModel.color2)
                .frame(maxWidth: .infinity)
                .overlay(Text("\(swapViewModel.number2)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white))
        }.frame(height: UIScreen.main.bounds.height * 0.7)
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
