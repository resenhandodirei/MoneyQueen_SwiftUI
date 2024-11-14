//
//  RetirementPlannerView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 14/11/24.
//

import SwiftUI

struct RetirementPlannerView: View {
    @State private var retirementGoal: Double = 500000.0  // Meta de aposentadoria em reais
    @State private var currentSavings: Double = 50000.0   // Poupança atual
    @State private var monthlyContribution: Double = 0.0  // Contribuição mensal necessária
    @State private var yearsUntilRetirement: Double = 25  // Anos restantes para aposentadoria
    @State private var estimatedReturnRate: Double = 5.0  // Taxa de retorno estimada (percentual anual)

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Planejador de Aposentadoria")
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)

                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Text("Meta de Aposentadoria:")
                        Spacer()
                        Text("R$ \(retirementGoal, specifier: "%.2f")")
                    }
                    Slider(value: $retirementGoal, in: 100000...2000000, step: 10000)
                        .padding(.horizontal)

                    HStack {
                        Text("Poupança Atual:")
                        Spacer()
                        Text("R$ \(currentSavings, specifier: "%.2f")")
                    }
                    Slider(value: $currentSavings, in: 0...1000000, step: 5000)
                        .padding(.horizontal)

                    HStack {
                        Text("Anos Até a Aposentadoria:")
                        Spacer()
                        Text("\(Int(yearsUntilRetirement)) anos")
                    }
                    Slider(value: $yearsUntilRetirement, in: 1...50, step: 1)
                        .padding(.horizontal)

                    HStack {
                        Text("Taxa de Retorno Anual:")
                        Spacer()
                        Text("\(estimatedReturnRate, specifier: "%.1f")%")
                    }
                    Slider(value: $estimatedReturnRate, in: 1...15, step: 0.5)
                        .padding(.horizontal)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

                Button(action: calculateMonthlyContribution) {
                    Text("Calcular Contribuição Mensal")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }

                if monthlyContribution > 0 {
                    Text("Para atingir sua meta de aposentadoria, você precisa contribuir mensalmente:")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    Text("R$ \(monthlyContribution, specifier: "%.2f")")
                        .font(.title)
                        .bold()
                        .foregroundColor(.purple)
                        .padding(.horizontal)
                }

                Spacer()
            }
            .navigationBarTitle("Planejador de Aposentadoria", displayMode: .inline)
        }
    }

    func calculateMonthlyContribution() {
        let rate = estimatedReturnRate / 100 / 12
        let months = yearsUntilRetirement * 12
        let futureValue = retirementGoal - currentSavings * pow(1 + rate, months)

        if rate != 0 {
            monthlyContribution = futureValue * rate / (pow(1 + rate, months) - 1)
        } else {
            monthlyContribution = futureValue / months
        }
    }
}

struct RetirementPlannerView_Previews: PreviewProvider {
    static var previews: some View {
        RetirementPlannerView()
    }
}
