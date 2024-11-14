//
//  TaxDeductionView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 14/11/24.
//


import SwiftUI

struct TaxDeductionView: View {
    @State private var deductionCategories: [DeductionCategory] = [
        DeductionCategory(name: "Educação", percentage: 15),
        DeductionCategory(name: "Saúde", percentage: 20),
        DeductionCategory(name: "Doações", percentage: 5),
        DeductionCategory(name: "Previdência Privada", percentage: 12),
        DeductionCategory(name: "Moradia", percentage: 8)
    ]
    
    @State private var selectedCategory: DeductionCategory?
    @State private var deductionAmount: String = ""
    @State private var totalDeduction: Double = 0.0
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Dedução Fiscal")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("wine"))
                
                Text("Insira o valor da dedução e selecione a categoria.")
                    .foregroundColor(.gray)
                
                HStack {
                    TextField("Valor da Dedução (R$)", text: $deductionAmount)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    Menu {
                        ForEach(deductionCategories) { category in
                            Button(action: {
                                selectedCategory = category
                            }) {
                                Text(category.name)
                            }
                        }
                    } label: {
                        Text(selectedCategory?.name ?? "Selecionar Categoria")
                            .foregroundColor(.gray)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                }
                
                Button(action: calculateDeduction) {
                    Text("Calcular Dedução")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("wine"))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.vertical, 10)
                
                if totalDeduction > 0 {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Deduções Calculadas")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color("wine"))
                        
                        Text("Categoria: \(selectedCategory?.name ?? "Nenhuma")")
                        Text("Valor Original: R$ \(deductionAmount)")
                        Text("Dedução Aplicada: R$ \(String(format: "%.2f", totalDeduction))")
                    }
                    .foregroundColor(.gray)
                    .padding(.top)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Deduções Fiscais")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // Função para calcular a dedução com base na categoria selecionada
    func calculateDeduction() {
        guard let amount = Double(deductionAmount),
              let category = selectedCategory else {
            return
        }
        totalDeduction = amount * (category.percentage / 100)
    }
}

// Modelo de dados para categoria de dedução
struct DeductionCategory: Identifiable {
    let id = UUID()
    let name: String
    let percentage: Double
}

struct TaxDeductionView_Previews: PreviewProvider {
    static var previews: some View {
        TaxDeductionView()
    }
}
