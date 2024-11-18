//
//  InvestmentSimulatorView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 14/11/24.
//

import SwiftUI

struct InvestmentSimulatorView: View {
    @State private var initialAmount: Double = 1000.0
    @State private var interestRate: Double = 5.0
    @State private var years: Double = 10
    @State private var finalAmount: Double = 0.0

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Simulador de Investimento")
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)

                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Text("Valor Inicial:")
                        Spacer()
                        Text("R$ \(initialAmount, specifier: "%.2f")")
                    }
                    Slider(value: $initialAmount, in: 100...100000, step: 1000)
                        .accentColor(.darkPink) // Cor personalizada do Slider
                        .padding(.horizontal)
                    
                    HStack {
                        Text("Taxa de Juros (% ao ano):")
                        Spacer()
                        Text("\(interestRate, specifier: "%.2f")%")
                    }
                    Slider(value: $interestRate, in: 1...20, step: 0.1)
                        .accentColor(.darkPink) // Cor personalizada do Slider
                        .padding(.horizontal)
                    
                    HStack {
                        Text("Período (anos):")
                        Spacer()
                        Text("\(Int(years)) anos")
                    }
                    Slider(value: $years, in: 1...30, step: 1)
                        .accentColor(.darkPink) // Cor personalizada do Slider
                        .padding(.horizontal)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

                Button(action: calculateInvestment) {
                    Text("Calcular Retorno")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.darkPink)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                if finalAmount > 0 {
                    Text("Valor Final Após \(Int(years)) Anos")
                        .font(.headline)
                        .padding(.top)
                        .padding(.horizontal, 16)
                    
                    Text("R$ \(finalAmount, specifier: "%.2f")")
                        .font(.title)
                        .bold()
                        .foregroundColor(.darkPink)
                        .padding(.horizontal, 32)
                }
                
                Spacer()
            }
        }
    }
    
    func calculateInvestment() {
        // Calcula o valor final com base em juros compostos
        let rate = interestRate / 100
        finalAmount = initialAmount * pow(1 + rate, years)
    }
}

struct InvestmentSimulatorView_Previews: PreviewProvider {
    static var previews: some View {
        InvestmentSimulatorView()
    }
}
