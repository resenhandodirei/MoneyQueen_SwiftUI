//
//  FinancialGoalsView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 14/11/24.
//

import SwiftUI

struct FinancialGoalsView: View {
    @State private var goals: [FinancialGoal] = [
        FinancialGoal(title: "Viagem para Europa", targetAmount: 10000, currentAmount: 3000),
        FinancialGoal(title: "Reserva de Emergência", targetAmount: 5000, currentAmount: 2000),
        FinancialGoal(title: "Novo Carro", targetAmount: 15000, currentAmount: 4000)
    ]
    @State private var showingAddGoal = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Título
                Text("Metas Financeiras")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                // Lista de Metas
                List {
                    ForEach(goals) { goal in
                        GoalProgressView(goal: goal)
                    }
                }
                .listStyle(PlainListStyle())
                
                // Botão para adicionar nova meta
                Button(action: {
                    showingAddGoal = true
                }) {
                    Text("Adicionar Nova Meta")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("darkPink"))
                        .cornerRadius(12)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                }
                .padding(.bottom)
                .sheet(isPresented: $showingAddGoal) {
                    AddGoalView(goals: $goals)
                }
            }
            .navigationTitle("Metas")
        }
    }
}

// Componente que representa o progresso de uma meta individual
struct GoalProgressView: View {
    var goal: FinancialGoal
    
    var progress: Double {
        return min(goal.currentAmount / goal.targetAmount, 1.0)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(goal.title)
                .font(.headline)
            ProgressView(value: progress)
                .accentColor(.green)
                .padding(.vertical)
            HStack {
                Text("Concluído: \(Int(progress * 100))%")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                Text(goal.currentAmount, format: .currency(code: "BRL"))
                    .font(.subheadline)
                Text("de \(goal.targetAmount, format: .currency(code: "BRL"))")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

// Tela para adicionar uma nova meta
struct AddGoalView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var goals: [FinancialGoal]
    
    @State private var title: String = ""
    @State private var targetAmount: String = ""
    @State private var currentAmount: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Nome da Meta")) {
                    TextField("Ex: Viagem para Europa", text: $title)
                }
                
                Section(header: Text("Valor Alvo")) {
                    TextField("Ex: 10000", text: $targetAmount)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Valor Atual")) {
                    TextField("Ex: 3000", text: $currentAmount)
                        .keyboardType(.decimalPad)
                }
                
                Button(action: addGoal) {
                    Text("Salvar Meta")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("darkPink"))
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Nova Meta")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func addGoal() {
        if let target = Double(targetAmount), let current = Double(currentAmount), !title.isEmpty {
            let newGoal = FinancialGoal(title: title, targetAmount: target, currentAmount: current)
            goals.append(newGoal)
            dismiss()
        }
    }
}

// Modelo de dados para uma meta financeira
struct FinancialGoal: Identifiable {
    let id = UUID()
    var title: String
    var targetAmount: Double
    var currentAmount: Double
}

struct FinancialGoalsView_Previews: PreviewProvider {
    static var previews: some View {
        FinancialGoalsView()
    }
}

