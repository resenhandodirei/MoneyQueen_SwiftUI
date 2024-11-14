//
//  ExpenseReportView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 14/11/24.
//

import SwiftUI
import Charts

struct ExpenseReportView: View {
    @State private var selectedMonth = "Novembro"
    @State private var expenses = [
        Expense(category: "Alimentação", amount: 450.0),
        Expense(category: "Transporte", amount: 120.0),
        Expense(category: "Lazer", amount: 200.0),
        Expense(category: "Educação", amount: 300.0),
        Expense(category: "Compras", amount: 150.0)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Cabeçalho com seleção de mês
                    HStack {
                        Text("Relatório de Despesas")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                        Picker("Mês", selection: $selectedMonth) {
                            Text("Novembro").tag("Novembro")
                            Text("Outubro").tag("Outubro")
                            Text("Setembro").tag("Setembro")
                        }
                        .pickerStyle(MenuPickerStyle())
                        .background(Color.pink.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.trailing)
                    }
                    .padding(.horizontal)

                    // Gráfico de Barras das Despesas por Categoria
                    Text("Despesas por Categoria")
                        .font(.headline)
                        .padding(.top)
                    
                    Chart(expenses) { expense in
                        BarMark(
                            x: .value("Categoria", expense.category),
                            y: .value("Valor", expense.amount)
                        )
                        .foregroundStyle(Color("darkPink"))
                    }
                    .frame(height: 300)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                    
                    // Resumo Total
                    Text("Resumo Total")
                        .font(.headline)
                        .padding(.top)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(expenses) { expense in
                            HStack {
                                Text(expense.category)
                                    .fontWeight(.medium)
                                Spacer()
                                Text(expense.amount, format: .currency(code: "BRL"))
                                    .foregroundColor(.pink)
                            }
                            Divider()
                        }
                        
                        // Total de despesas
                        HStack {
                            Text("Total")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Spacer()
                            Text(expenses.map { $0.amount }.reduce(0, +), format: .currency(code: "BRL"))
                                .font(.title2)
                                .foregroundColor(.pink)
                                .fontWeight(.semibold)
                        }
                        .padding(.top, 10)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                }
                .navigationTitle("Relatório de Despesas")
                .padding(.bottom)
            }
        }
    }
}

// Modelo de dados para uma despesa
struct Expense: Identifiable {
    let id = UUID()
    let category: String
    let amount: Double
}

struct ExpenseReportView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseReportView()
    }
}
