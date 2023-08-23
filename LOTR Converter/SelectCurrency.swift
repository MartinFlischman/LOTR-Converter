//
//  SelectCurrency.swift
//  LOTR Converter
//
//  Created by Martin Flischman on 2023/08/22.
//

import SwiftUI

struct SelectCurrency: View {
    @State var gridLayout = [GridItem(), GridItem(), GridItem()]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            // Background parchment image
            Image("parchment")
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                // Text
            Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                // Currency icons
                LazyVGrid(columns: gridLayout) {
                    ForEach(0..<5) { _ in
                        CurrencyIcon(currencyImage: "copperpenny", currencyText: "Copper Penny")
                    }
                }
                
                // Text
                Text("Select the currency you would like to convert to:")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                
                // Currency icons
                
                // Done button
                Button("Done") {
                    dismiss()
                }
                .font(.largeTitle)
                .padding(10)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(15)
            }
        }
    }
}

struct SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrency()
    }
}
