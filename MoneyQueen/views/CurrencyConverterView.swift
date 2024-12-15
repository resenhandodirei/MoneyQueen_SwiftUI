//
//  CurrencyConverterView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 14/11/24.
//

import SwiftUI

struct CurrencyConverterView: View {
    @State private var amount: String = ""
    @State private var fromCurrency: String = "USD"
    @State private var toCurrency: String = "BRL"
    @State private var convertedAmount: String = ""
    @State private var isConverting = false
    
    let currencies = ["USD", "BRL", "EUR", "JPY", "GBP", "CAD", "AUD", "CNY"]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
//                Text("Conversor de Moedas")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .padding(.top)
//                    .foregroundColor(.darkPink)
                
                TextField("Valor", text: $amount)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                HStack {
                    Text("De:")
                        .fontWeight(.bold)
                    Spacer()
                    Picker("Moeda de Origem", selection: $fromCurrency) {
                        ForEach(currencies, id: \.self) { currency in
                            Text(currency).tag(currency)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding(.horizontal)
                
                HStack {
                    Text("Para:")
                        .fontWeight(.bold)
                    Spacer()
                    Picker("Moeda de Destino", selection: $toCurrency) {
                        ForEach(currencies, id: \.self) { currency in
                            Text(currency).tag(currency)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding(.horizontal)
                
                Button(action: convertCurrency) {
                    Text("Converter")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("darkPink"))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .shadow(radius: 5)
                }
                .disabled(isConverting || amount.isEmpty || fromCurrency == toCurrency)
                
                if !convertedAmount.isEmpty {
                    Text("Valor Convertido: \(convertedAmount)")
                        .font(.title)
                        .padding()
                }
                
                Spacer()
            }
            .navigationTitle("Conversor")
            .navigationBarTitleDisplayMode(.inline)

            
        }
    }
    
    // Função de conversão (simulada)
    private func convertCurrency() {
        isConverting = true
        convertedAmount = ""
        
        // Simulação de uma taxa de conversão para exemplo
        let exampleRates: [String: Double] = [
            "USD_BRL": 5.0, "BRL_USD": 0.2,
            "USD_EUR": 0.85, "EUR_USD": 1.18,
            "BRL_EUR": 0.17, "EUR_BRL": 5.8
        ]
        
        // Valor a converter
        if let amountValue = Double(amount) {
            let conversionKey = "\(fromCurrency)_\(toCurrency)"
            if let rate = exampleRates[conversionKey] {
                let result = amountValue * rate
                convertedAmount = String(format: "%.2f \(toCurrency)", result)
            } else {
                convertedAmount = "Taxa não encontrada"
            }
        } else {
            convertedAmount = "Valor inválido"
        }
        
        isConverting = false
    }
}

struct CurrencyConverterView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyConverterView()
    }
}
