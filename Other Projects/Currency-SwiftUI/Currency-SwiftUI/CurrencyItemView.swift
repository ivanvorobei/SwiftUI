//
//  CurrencyItem.swift
//  Currency-SwiftUI
//
//  Created by Alex Liu on 2019-06-20.
//  Copyright © 2018 Alex Liu <alexliubo@gmail.com> All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import SwiftUI

struct CurrencyItemView: View {
    @EnvironmentObject var userData: UserData
    let currency: Currency
    let baseAmount: Double
    @Binding var isEditing: Bool
    
    var body: some View {
        let currency = self.currency
        let converstionRate = String(format: "%.4f", currency.rate / userData.baseCurrency.rate)
        let totalAmount = String(format: "%.3f", baseAmount * ( userData.baseCurrency.rate / currency.rate))

        return HStack {
            if self.isEditing {
                // This is for delete mode
                HStack(alignment: .center){
                    Image(systemName: "minus.circle")
                        .foregroundColor(.red)
                        .onTapGesture(count: 1) {
                            self.delete()
                    }
                    
                    Text(currency.flag).font(.title)
                    VStack(alignment: .leading){
                        Text(currency.code)
                        Text(currency.name).foregroundColor(.gray)
                    }
                }
            }
            else {
                // This is normal mode
                HStack{
                    // Flag
                    Text(currency.flag).font(.largeTitle)
                    // Code and name
                    VStack(alignment: .leading){
                        Text(currency.code).font(.headline)
                        Text(currency.name).font(.footnote).foregroundColor(.gray)
                    }
                    Spacer()
                    // Amount and conversion
                    VStack(alignment: .trailing){
                        Text("\(totalAmount)")
                        // Would be 1 this currency = xxx base currency
                        Text("1 \(currency.code) = \(converstionRate) \(userData.baseCurrency.code)")
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
    
    // TODO: need to implement
    private func delete() {
    }
}

