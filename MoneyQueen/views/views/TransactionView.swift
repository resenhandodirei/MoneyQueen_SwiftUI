//
//  TransactionView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 13/11/24.
//

import SwiftUI

struct Transaction: Identifiable {
    let id = UUID()
    let title: String
    let amount: Double
    let date: Date
    let category: String
}

struct TransactionView: View {
    @State private var transactions: [Transaction] = [
        Transaction(title: "Café", amount: -5.0, date: Date(), category: "Alimentação"),
        Transaction(title: "Salário", amount: 1500.0, date: Date(), category: "Receita"),
        Transaction(title: "Transporte", amount: -20.0, date: Date(), category: "Transporte")
    ]
    @State private var showingAddTransaction = false

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(transactions) { transaction in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(transaction.title)
                                    .font(.headline)
                                Text(transaction.category)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Text("\(transaction.amount, specifier: "%.2f")")
                                .fontWeight(.bold)
                                .foregroundColor(transaction.amount < 0 ? .red : .green)
                        }
                    }
                    .onDelete(perform: deleteTransaction)
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Transações")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showingAddTransaction = true
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .sheet(isPresented: $showingAddTransaction) {
                AddTransactionView(transactions: $transactions)
            }
        }
    }

    private func deleteTransaction(at offsets: IndexSet) {
        transactions.remove(atOffsets: offsets)
    }
}

struct AddTransactionView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var transactions: [Transaction]
    @State private var title: String = ""
    @State private var amount: String = ""
    @State private var category: String = ""
    @State private var date = Date()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Detalhes da Transação")) {
                    TextField("Título", text: $title)
                    TextField("Valor", text: $amount)
                        .keyboardType(.decimalPad)
                    TextField("Categoria", text: $category)
                    DatePicker("Data", selection: $date, displayedComponents: .date)
                }
                
                Section {
                    Button(action: saveTransaction) {
                        Text("Salvar")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .navigationTitle("Nova Transação")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
            }
        }
    }

    private func saveTransaction() {
        if let amountValue = Double(amount) {
            let newTransaction = Transaction(title: title, amount: amountValue, date: date, category: category)
            transactions.append(newTransaction)
            dismiss()
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
    }
}

