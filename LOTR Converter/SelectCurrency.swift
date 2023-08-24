//
//  SelectCurrency.swift
//  LOTR Converter
//
//  Created by Martin Flischman on 2023/08/22.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    @State var gridLayout = [GridItem(), GridItem(), GridItem()]
    
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
                    ForEach(0..<5) { i in
                        if Currency.allCases[i] == leftCurrency {
                            CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue, currencyText: CurrencyText.allCases[i].rawValue)
                                .overlay(RoundedRectangle(cornerRadius: 25)
                                    .stroke(lineWidth: 3)
                                    .opacity(0.5))
                                .shadow(color: .black, radius: 9)
                        } else {
                            CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue, currencyText: CurrencyText.allCases[i].rawValue)
                        }
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
        SelectCurrency(leftCurrency: .constant(.silverPiece), rightCurrency: .constant(.goldPiece))
    }
}
