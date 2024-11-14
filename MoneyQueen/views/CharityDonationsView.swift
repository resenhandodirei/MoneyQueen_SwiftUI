//
//  CharityDonationsView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 14/11/24.
//

import SwiftUI

struct CharityDonationsView: View {
    @State private var donationGoal: Double = 1000.0
    @State private var currentDonations: Double = 0.0
    @State private var donationAmount: Double = 0.0
    @State private var donationList: [String: Double] = [:] // Nome da organização e valor doado

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Doações de Caridade")
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Text("Meta de Doação:")
                        Spacer()
                        Text("R$ \(donationGoal, specifier: "%.2f")")
                    }
                    Slider(value: $donationGoal, in: 100...10000, step: 100)
                        .padding(.horizontal)
                    
                    HStack {
                        Text("Doações Realizadas:")
                        Spacer()
                        Text("R$ \(currentDonations, specifier: "%.2f")")
                    }
                    
                    ProgressView(value: currentDonations, total: donationGoal)
                        .accentColor(.purple)
                        .padding(.horizontal)
                    
                    Divider()
                    
                    Text("Adicionar Doação")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    HStack {
                        Text("Valor da Doação:")
                        Spacer()
                        TextField("R$ 0,00", value: $donationAmount, format: .number)
                            .keyboardType(.decimalPad)
                            .padding()
                            .frame(width: 100)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    Button(action: addDonation) {
                        Text("Adicionar Doação")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

                List {
                    ForEach(donationList.sorted(by: >), id: \.key) { organization, amount in
                        HStack {
                            Text(organization)
                            Spacer()
                            Text("R$ \(amount, specifier: "%.2f")")
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .padding(.top)

                Spacer()
            }
            .navigationBarTitle("Doações de Caridade", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Meta Atingida") {
                        resetDonations()
                    }
                    .disabled(currentDonations < donationGoal)
                }
            }
        }
    }

    // Função para adicionar uma doação
    func addDonation() {
        guard donationAmount > 0 else { return }
        
        let organizationName = "Organização \(donationList.count + 1)" // Nome genérico para simplificação
        donationList[organizationName] = donationAmount
        currentDonations += donationAmount
        donationAmount = 0.0
    }
    
    // Função para resetar doações ao atingir a meta
    func resetDonations() {
        donationList.removeAll()
        currentDonations = 0.0
    }
}

struct CharityDonationsView_Previews: PreviewProvider {
    static var previews: some View {
        CharityDonationsView()
    }
}
