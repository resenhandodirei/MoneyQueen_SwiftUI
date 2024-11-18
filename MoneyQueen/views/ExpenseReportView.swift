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
                        
                        // Picker customizado
                        MonthPicker(selectedMonth: $selectedMonth)
                            .frame(width: 150, height: 40)
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
                .padding(.bottom)
            }
        }
    }
}

// Picker customizado para seleção de mês
struct MonthPicker: View {
    @Binding var selectedMonth: String
    
    let months = ["Novembro", "Outubro", "Setembro"]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.pink.opacity(0.15))
                .shadow(radius: 5)
            
            Picker("Mês", selection: $selectedMonth) {
                ForEach(months, id: \.self) { month in
                    Text(month).tag(month)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .foregroundColor(Color("darkPink"))
            .padding(.horizontal)
        }
        .padding(.vertical, 5)
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
