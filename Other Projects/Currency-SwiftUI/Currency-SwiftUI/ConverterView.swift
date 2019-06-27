//
//  ContentView.swift
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

struct ConverterView : View {
    @EnvironmentObject var userData: UserData
    @State var baseAmount: String = "1.0"
    @State var isEditing: Bool = false
    @State var lastUpdated: String = ""
    
    var body: some View {
        let inset = EdgeInsets(top: -8, leading: -20, bottom: -7, trailing: 5)
        let doubleValue: Double = Double(self.$baseAmount.value) ?? 1.0
        
        return ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading){
                Text("From:").bold().color(.gray)
                HStack{
                    // Flag
                    Text("\(userData.baseCurrency.flag)").padding(5)
                    // Code and name
                    VStack(alignment: .leading){
                        Text(userData.baseCurrency.code).color(.white)
                        Text(userData.baseCurrency.name).color(.white)
                    }
                    Spacer()
                    // Amount and conversion
                    TextField($baseAmount, placeholder: Text("1.0"), onCommit: {
                        // TODO: update all currencies on the following list
                    }).foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.clear)
                                .border(Color(red: 0.7, green: 0.7, blue: 0.7), width: 1 / UIScreen.main.scale, cornerRadius: 5)
                                .padding(inset)
                        )
                }.background(Color.blue).cornerRadius(5)
                Text("To:").bold().color(.gray)
                List {
                    // TODO: should filter out BaseCurrency from list
                    ForEach(userData.userCurrency) { currency in
                        	CurrencyItemView(currency: currency, baseAmount: doubleValue, isEditing: self.$isEditing).tapAction {
                            	// Swap this and base
                            	self.userData.baseCurrency = currency
                        	}
                        }
                    }.onAppear(perform: loadCurrencies)
                    .navigationBarItem(title: Text("Currenceis 💱"))
                    .navigationBarItems(trailing: Button(action: { self.isEditing.toggle() }) {
                        if !self.isEditing {
                            Text("Edit")
                        } else {
                            Text("Done").bold()
                        }
                    })
                Text("Last updated: \(self.lastUpdated)").color(.gray).bold()
            }
             NavigationButton(destination: AddCurrencyView().environmentObject(self.userData)) {
                	Text("💰")
                }.frame(width: 46, height: 46, alignment: .center)
                .background(
                    RoundedRectangle(cornerRadius: 23)
                        .fill(Color.blue)
                        .border(Color(red: 0.7, green: 0.7, blue: 0.7), width: 1 / UIScreen.main.scale, cornerRadius: 23))
                .foregroundColor(.white).font(.largeTitle)
        }.padding()
    }
    
    private func loadCurrencies() {
        // Check if last updated is the same date
        // if not the same pull from remote with base currency
        let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD")!

        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, _ in
            if let data = data {
                if let decoded: CurrencyList = self.decodeData(CurrencyList.self, data){
                    //
                    self.lastUpdated = decoded.date
                    
                    // generate currency data
                    var newCurrencies = [Currency]()
                    for key in decoded.rates.keys {
                        let newCurrency = Currency(name: supportedCurrencies[key]?[0] ?? "Unknown", rate: 1.0 / (decoded.rates[key] ?? 1.0), symbol: supportedCurrencies[key]?[1] ?? "", code: key)
                        newCurrencies.append(newCurrency)
                    }
                    
                    DispatchQueue.main.async {
                        self.userData.allCurrencies = newCurrencies
                        
                        if let base = self.userData.allCurrencies.filter({ $0.symbol == self.userData.baseCurrency.symbol }).first {
                            self.userData.baseCurrency = base
                        }
                        
                        var tempNewUserCurrency = [Currency]()
                        let userCurrencies = self.userData.userCurrency.map{ $0.code }
                        for c in self.userData.allCurrencies {
                            if userCurrencies.contains(c.code){
                                tempNewUserCurrency.append(c)
                            }
                        }
                        
                        self.userData.userCurrency = tempNewUserCurrency
                    }
                }
            }
        })
        task.resume()
    }
}

extension ConverterView
{
    private func decodeData<T>(_ decodeObject: T.Type, _ data: Data) -> T? where T: Codable
    {
        let decoder = JSONDecoder()
        do
        {
            return try decoder.decode(decodeObject.self, from: data)
        }
        catch let jsonErr
        {
            print("Error decoding Json ", jsonErr)
            return nil
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ConverterView().environmentObject(UserData())
    }
}
#endif
