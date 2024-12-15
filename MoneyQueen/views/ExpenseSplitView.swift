//
//  ExpenseSplitView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 14/11/24.
//

import SwiftUI

struct ExpenseSplitView: View {
    @State private var totalAmount: String = ""
    @State private var numberOfPeople: String = ""
    @State private var includeTip: Bool = false
    @State private var tipPercentage: Double = 10
    @State private var result: String = ""
    @State private var selectedTipOption = 10
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Dividir Despesa")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("wine"))
                    .padding(.top, 20)
                
                HStack {
                    Text("Valor Total:")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Spacer()
                    TextField("R$ 0,00", text: $totalAmount)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 150)
                }
                .padding()
                
                HStack {
                    Text("Número de Pessoas:")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Spacer()
                    TextField("0", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 150)
                }
                .padding()
                
                Toggle(isOn: $includeTip) {
                    Text("Incluir Gorjeta")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                .toggleStyle(SwitchToggleStyle(tint: Color("darkPink")))
                .padding(.horizontal)
                
                if includeTip {
                    VStack {
                        Text("Porcentagem da Gorjeta:")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Picker("Escolha a porcentagem", selection: $selectedTipOption) {
                            Text("10%").tag(10)
                            Text("15%").tag(15)
                            Text("20%").tag(20)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                        .background(Color("darkPink").opacity(0.2))
                        .cornerRadius(8)
                    }
                }
                
                Button(action: calculateSplit) {
                    Text("Calcular Divisão")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("darkPink"))
                        .cornerRadius(12)
                        .shadow(radius: 5)
                }
                .padding()
                
                if !result.isEmpty {
                    Text(result)
                        .font(.title2)
                        .foregroundColor(Color("wine"))
                        .padding()
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // Função para calcular a divisão da despesa
    func calculateSplit() {
        guard let total = Double(totalAmount),
              let people = Int(numberOfPeople), people > 0 else {
            result = "Por favor, insira valores válidos para o total e número de pessoas."
            return
        }
        
        var finalAmount = total
        if includeTip {
            finalAmount += total * (Double(selectedTipOption) / 100)
        }
        
        let splitAmount = finalAmount / Double(people)
        result = String(format: "Cada pessoa deve pagar: R$ %.2f", splitAmount)
    }
}

struct ExpenseSplitView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseSplitView()
    }
}
