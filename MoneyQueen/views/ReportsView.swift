//
//  ReportsView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 13/11/24.
//

import SwiftUI
import Charts // Certifique-se de ter a biblioteca Charts instalada

struct ReportsView: View {
    @State private var selectedDateRange: DateRange = .monthly // Intervalo de datas selecionado
    @State private var showDetail = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Relatórios")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("wine"))
                
                Text("Veja um resumo das suas finanças e mantenha tudo sob controle")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                VStack(alignment: .leading) {
                    Text("Gastos Mensais")
                        .font(.headline)
                        .foregroundColor(Color("darkPink"))
                    
                    MonthlySpendingChart()
                        .frame(height: 200)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Resumo dos Gastos")
                        .font(.headline)
                        .foregroundColor(Color("darkPink"))
                    
                    HStack {
                        SummaryCard(title: "Total Gastos", amount: "$1,500", color: .red)
                        SummaryCard(title: "Orçamento Restante", amount: "$500", color: .green)
                    }
                    
                    HStack {
                        SummaryCard(title: "Gastos Necessários", amount: "$1,000", color: .orange)
                        SummaryCard(title: "Gastos Supérfluos", amount: "$500", color: .purple)
                    }
                }
                
                Spacer()
                
                Picker("Período", selection: $selectedDateRange) {
                    ForEach(DateRange.allCases, id: \.self) { range in
                        Text(range.rawValue.capitalized).tag(range)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Button(action: {
                    showDetail.toggle()
                }) {
                    Text("Ver Detalhes dos Gastos")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("darkPink"))
                        .cornerRadius(12)
                        .shadow(radius: 5)
                }
                .padding(.horizontal)
                .sheet(isPresented: $showDetail) {
                    ExpenseDetailView()
                }
            }
            .padding()
//            .navigationTitle("Relatórios")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Gráfico de Gastos Mensais (Placeholder para o Chart)
struct MonthlySpendingChart: View {
    var body: some View {
        // Implementação de um gráfico ou placeholder
        RoundedRectangle(cornerRadius: 12)
            .fill(Color("lightPink").opacity(0.8))
            .overlay(Text("Gráfico de Gastos Mensais").foregroundColor(.white))
    }
}

// Cartão Resumo dos Gastos
struct SummaryCard: View {
    var title: String
    var amount: String
    var color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(color)
            Text(amount)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(color)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

// Intervalos de Data para o Relatório
enum DateRange: String, CaseIterable {
    case daily = "diário"
    case weekly = "semanal"
    case monthly = "mensal"
    case yearly = "anual"
}

// Detalhe dos Gastos (Placeholder para a View)
struct ExpenseDetailView: View {
    var body: some View {
        VStack {
            Text("Detalhes dos Gastos")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            List {
                ExpenseRow(category: "Alimentação", amount: "$400")
                ExpenseRow(category: "Transporte", amount: "$200")
                ExpenseRow(category: "Lazer", amount: "$150")
                ExpenseRow(category: "Outros", amount: "$250")
            }
        }
    }
}

// Linha de Gastos (Placeholder para Detalhe dos Gastos)
struct ExpenseRow: View {
    var category: String
    var amount: String
    
    var body: some View {
        HStack {
            Text(category)
                .font(.headline)
                .foregroundColor(.gray)
            Spacer()
            Text(amount)
                .font(.headline)
                .foregroundColor(Color("darkPink"))
        }
        .padding(.vertical, 8)
    }
}

struct ReportsView_Previews: PreviewProvider {
    static var previews: some View {
        ReportsView()
    }
}
