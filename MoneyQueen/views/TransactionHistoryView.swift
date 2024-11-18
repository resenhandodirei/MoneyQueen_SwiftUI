//
//  TransactionHistoryView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 14/11/24.
//

import SwiftUI

struct TransactionHistoryView: View {
    // Exemplo de dados de transação
    let transactions = [
        TransactionItem(date: "13/11/24", category: "Alimentação", amount: -50.0, description: "Jantar em restaurante"),
        TransactionItem(date: "12/11/24", category: "Transporte", amount: -20.0, description: "Taxi"),
        TransactionItem(date: "10/11/24", category: "Salário", amount: 3000.0, description: "Recebimento mensal"),
        TransactionItem(date: "08/11/24", category: "Lazer", amount: -80.0, description: "Cinema"),
        TransactionItem(date: "05/11/24", category: "Supermercado", amount: -120.0, description: "Compras semanais")
    ]
    
    var body: some View {
        NavigationView {
            List(transactions) { transaction in
                HStack {
                    VStack(alignment: .leading) {
                        Text(transaction.category)
                            .font(.headline)
                            .foregroundColor(transaction.amount < 0 ? .lightPink : .darkPink)
                        Text(transaction.description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text(transaction.date)
                            .font(.footnote)
                            .foregroundColor(.gray)
                        Text(transaction.amount, format: .currency(code: "BRL"))
                            .font(.headline)
                            .foregroundColor(transaction.amount < 0 ? .lightPink : .darkPink)
                    }
                }
                .padding(.vertical, 8)
            }
            .navigationTitle("Histórico de Transações")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        // Ação de adicionar nova transação
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.pink)
                    }
                }
            }
        }
    }
}

// Modelo de dados para uma transação
struct TransactionItem: Identifiable {
    let id = UUID()
    let date: String
    let category: String
    let amount: Double
    let description: String
}

struct TransactionHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionHistoryView()
    }
}
