//
//  RecurringExpensesView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 14/11/24.
//

import SwiftUI

struct RecurringExpense: Identifiable {
    let id = UUID()
    var name: String
    var amount: Double
    var dueDate: Date
    var category: String
}

struct RecurringExpensesView: View {
    @State private var recurringExpenses: [RecurringExpense] = [
        RecurringExpense(name: "Netflix", amount: 29.90, dueDate: Date(), category: "Entretenimento"),
        RecurringExpense(name: "Academia", amount: 99.00, dueDate: Date().addingTimeInterval(7 * 24 * 60 * 60), category: "Saúde"),
        RecurringExpense(name: "Spotify", amount: 19.90, dueDate: Date().addingTimeInterval(15 * 24 * 60 * 60), category: "Entretenimento")
    ]
    @State private var showingAddExpenseView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(recurringExpenses) { expense in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(expense.name)
                                .font(.headline)
                            Text("Vencimento: \(formattedDate(expense.dueDate))")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("R$ \(expense.amount, specifier: "%.2f")")
                                .bold()
                            Text(expense.category)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: deleteExpense)
            }
            .navigationBarTitle("Despesas Recorrentes", displayMode: .inline)
            .navigationBarItems(
                trailing: Button(action: {
                    showingAddExpenseView = true
                }) {
                    Image(systemName: "plus.circle")
                        .font(.title)
                        .foregroundColor(.purple)
                }
            )
            .sheet(isPresented: $showingAddExpenseView) {
                AddRecurringExpenseView(recurringExpenses: $recurringExpenses)
            }
        }
    }

    func deleteExpense(at offsets: IndexSet) {
        recurringExpenses.remove(atOffsets: offsets)
    }

    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}

struct AddRecurringExpenseView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var recurringExpenses: [RecurringExpense]
    @State private var name = ""
    @State private var amount = ""
    @State private var dueDate = Date()
    @State private var category = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Nome", text: $name)
                TextField("Valor", text: $amount)
                    .keyboardType(.decimalPad)
                DatePicker("Data de Vencimento", selection: $dueDate, displayedComponents: .date)
                TextField("Categoria", text: $category)
            }
            .navigationBarTitle("Adicionar Despesa", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancelar") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Salvar") {
                    if let amountValue = Double(amount) {
                        let newExpense = RecurringExpense(name: name, amount: amountValue, dueDate: dueDate, category: category)
                        recurringExpenses.append(newExpense)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            )
        }
    }
}

struct RecurringExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        RecurringExpensesView()
    }
}

