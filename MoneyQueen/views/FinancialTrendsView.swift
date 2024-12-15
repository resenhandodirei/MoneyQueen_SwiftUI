//
//  FinancialTrendsView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 14/11/24.
//

import SwiftUI
import Charts

struct FinancialTrendsView: View {
    // Dados simulados para tendências financeiras (normalmente viriam de uma API ou Core Data)
    @State private var expenseData: [FinancialData] = [
        FinancialData(month: "Jan", expense: 500, income: 1200),
        FinancialData(month: "Feb", expense: 600, income: 1100),
        FinancialData(month: "Mar", expense: 700, income: 1300),
        FinancialData(month: "Apr", expense: 750, income: 1400),
        FinancialData(month: "May", expense: 800, income: 1500),
        FinancialData(month: "Jun", expense: 850, income: 1550),
        FinancialData(month: "Jul", expense: 780, income: 1450),
        FinancialData(month: "Aug", expense: 820, income: 1600),
        FinancialData(month: "Sep", expense: 900, income: 1700),
        FinancialData(month: "Oct", expense: 1000, income: 1800),
        FinancialData(month: "Nov", expense: 1100, income: 1850),
        FinancialData(month: "Dec", expense: 1200, income: 1900)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Tendências Financeiras")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("wine"))
                    .padding(.top, 20)
                
                Chart {
                    ForEach(expenseData) { data in
                        LineMark(
                            x: .value("Mês", data.month),
                            y: .value("Despesa", data.expense)
                        )
                        .foregroundStyle(Color("lightPink"))
                        .symbol(Circle())
                        .interpolationMethod(.catmullRom)
                        
                        LineMark(
                            x: .value("Mês", data.month),
                            y: .value("Receita", data.income)
                        )
                        .foregroundStyle(Color("darkPink"))
                        .interpolationMethod(.catmullRom)
                    }
                }
                .chartLegend(position: .bottom, alignment: .leading) {
                    Label("Despesa", systemImage: "circle.fill")
                        .foregroundColor(Color("lightPink"))
                    Label("Receita", systemImage: "square.fill")
                        .foregroundColor(Color("darkPink"))
                }
                .frame(height: 300)
                .padding()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Resumo das Tendências")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("wine"))
                    
                    Text("• Receita total do ano: R$ \(calculateTotalIncome())")
                    Text("• Despesa total do ano: R$ \(calculateTotalExpense())")
                    Text("• Saldo médio mensal: R$ \(calculateAverageBalance())")
                }
                .foregroundColor(.gray)
                .padding()
                
                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
        .onChange(of: expenseData) { newValue in
            print("expenseData foi alterado!")
        }
    }
    
    // Funções para calcular totais e média
    func calculateTotalIncome() -> String {
        let totalIncome = expenseData.reduce(0) { $0 + $1.income }
        return String(format: "%.2f", totalIncome)
    }
    
    func calculateTotalExpense() -> String {
        let totalExpense = expenseData.reduce(0) { $0 + $1.expense }
        return String(format: "%.2f", totalExpense)
    }
    
    func calculateAverageBalance() -> String {
        let totalIncome = expenseData.reduce(0) { $0 + $1.income }
        let totalExpense = expenseData.reduce(0) { $0 + $1.expense }
        let averageBalance = (totalIncome - totalExpense) / Double(expenseData.count)
        return String(format: "%.2f", averageBalance)
    }
}

// Estrutura de dados para armazenar informações de cada mês
struct FinancialData: Identifiable, Equatable {
    let id = UUID()
    let month: String
    let expense: Double
    let income: Double
}

struct FinancialTrendsView_Previews: PreviewProvider {
    static var previews: some View {
        FinancialTrendsView()
    }
}
