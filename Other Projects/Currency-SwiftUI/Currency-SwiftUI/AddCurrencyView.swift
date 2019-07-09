//
//  AddCurrencyView.swift
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

import Foundation
import SwiftUI

struct AddCurrencyView : View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List {
            ForEach(userData.allCurrencies) { currency in
                return HStack {
                    Button(action: { self.select(currency) }) {
                        Text("\(currency.code) - \(currency.name)")
                    }
                    Spacer()
                    if self.isSelected(currency) {
                        Image(systemName: "checkmark").foregroundColor(.blue)
                    }
                }
            }
            }.navigationBarTitle(Text("Add Currency"))
    }
    
    private func select(_ currency: Currency) {
        if userData.userCurrency.map({ $0.code }).contains(currency.code) {
            userData.userCurrency.removeAll{$0.code == currency.code}
        }
        else {
            userData.userCurrency.append(currency)
        }
    }
    
    private func isSelected(_ currency: Currency) -> Bool {
        return userData.userCurrency.map({ $0.code }).contains(currency.code)
    }
}


