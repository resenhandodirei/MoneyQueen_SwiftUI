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
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Text("Meta de Doação:")
                        Spacer()
                        Text("R$ \(donationGoal, specifier: "%.2f")")
                    }
                    Slider(value: $donationGoal, in: 100...10000, step: 100)
                        .accentColor(Color("darkPink")) // Cor darkPink no Slider
                        .padding(.horizontal)
                    
                    HStack {
                        Text("Doações Realizadas:")
                        Spacer()
                        Text("R$ \(currentDonations, specifier: "%.2f")")
                    }
                    
                    ProgressView(value: currentDonations, total: donationGoal)
                        .accentColor(Color("darkPink")) // Cor darkPink na ProgressView
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
                            .background(Color("darkPink")) // Cor darkPink no botão
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
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Doação Adicionada"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

    // Função para adicionar uma doação
    func addDonation() {
        // Verifica se o valor da doação é maior que zero
        guard donationAmount > 0 else {
            alertMessage = "O valor da doação precisa ser maior que zero."
            showAlert = true
            return
        }
        
        // Nome genérico para a organização
        let organizationName = "Organização \(donationList.count + 1)"
        donationList[organizationName] = donationAmount
        currentDonations += donationAmount
        alertMessage = "Você doou R$ \(donationAmount) para \(organizationName)."
        showAlert = true
        
        // Resetar o valor da doação
        donationAmount = 0.0
    }
    
    // Função para resetar doações ao atingir a meta
    func resetDonations() {
        donationList.removeAll()
        currentDonations = 0.0
        alertMessage = "As doações foram resetadas com sucesso!"
        showAlert = true
    }
}

struct CharityDonationsView_Previews: PreviewProvider {
    static var previews: some View {
        CharityDonationsView()
    }
}
