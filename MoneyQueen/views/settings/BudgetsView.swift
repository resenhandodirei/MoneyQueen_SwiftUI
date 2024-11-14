//
//  BudgetsView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 13/11/24.
//

import SwiftUI

struct BudgetsView: View {
    @State private var budgets: [Budget] = [
        Budget(category: "Alimentação", limit: 500, spent: 200),
        Budget(category: "Transporte", limit: 300, spent: 150),
        Budget(category: "Lazer", limit: 200, spent: 50)
    ]
    @State private var showingAddBudget = false

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(budgets) { budget in
                        BudgetRowView(budget: budget)
                    }
                }
                .listStyle(InsetGroupedListStyle())
                
                Button(action: {
                    showingAddBudget = true
                }) {
                    Text("Adicionar Orçamento")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("darkPink"))
                        .cornerRadius(10)
                        .padding()
                }
            }
            .navigationTitle("Orçamentos")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showingAddBudget) {
                AddBudgetView(budgets: $budgets)
            }
        }
    }
}

struct BudgetRowView: View {
    var budget: Budget

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(budget.category)
                    .font(.headline)
                
                Spacer()
                
                Text("\(Int((budget.spent / budget.limit) * 100))% usado")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            ProgressView(value: budget.spent, total: budget.limit)
                .progressViewStyle(LinearProgressViewStyle(tint: Color("lightPink")))
            
            HStack {
                Text("Limite: \(budget.limit, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Text("Gasto: \(budget.spent, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}

struct AddBudgetView: View {
    @Binding var budgets: [Budget]
    @Environment(\.presentationMode) var presentationMode

    @State private var category = ""
    @State private var limit: Double = 0.0

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Categoria")) {
                    TextField("Nome da categoria", text: $category)
                }
                
                Section(header: Text("Limite")) {
                    TextField("Limite do orçamento", value: $limit, format: .currency(code: "USD"))
                        .keyboardType(.decimalPad)
                }
                
                Button(action: addBudget) {
                    Text("Salvar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("darkPink"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Novo Orçamento")
            .navigationBarItems(trailing: Button("Cancelar") {
                presentationMode.wrappedValue.dismiss()
            })
        }.foregroundColor(.darkPink)
        
    }

    func addBudget() {
        let newBudget = Budget(category: category, limit: limit, spent: 0)
        budgets.append(newBudget)
        presentationMode.wrappedValue.dismiss()
    }
}

// Modelo para o Orçamento
struct Budget: Identifiable {
    let id = UUID()
    var category: String
    var limit: Double
    var spent: Double
}

struct BudgetsView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetsView()
    }
}
