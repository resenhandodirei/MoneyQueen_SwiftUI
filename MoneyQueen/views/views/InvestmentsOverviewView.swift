//
//  InvestmentsOverviewView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 14/11/24.
//

import SwiftUI
import Charts

struct InvestmentsOverviewView: View {
    @State private var totalInvestment = 15000.0
    @State private var totalProfit = 1200.0
    @State private var investments = [
        Investment(type: "Ações", amount: 7000.0),
        Investment(type: "Fundos", amount: 3000.0),
        Investment(type: "Poupança", amount: 2000.0),
        Investment(type: "CDB", amount: 3000.0)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Cabeçalho: Saldo e Rendimento
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Visão Geral dos Investimentos")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        Text("Saldo Total")
                            .font(.headline)
                            .padding(.top)
                        
                        Text(totalInvestment, format: .currency(code: "BRL"))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .padding(.bottom, 5)
                        
                        Text("Rendimento Total")
                            .font(.headline)
                        
                        Text(totalProfit, format: .currency(code: "BRL"))
                            .font(.title)
                            .foregroundColor(totalProfit >= 0 ? .green : .red)
                    }
                    .padding()
                    .background(Color("lightPink").opacity(0.2))
                    .cornerRadius(12)
                    .shadow(radius: 5)
                    .padding(.horizontal)

                    // Gráfico de Pizza de Investimentos por Tipo
                    Text("Distribuição dos Investimentos")
                        .font(.headline)
                        .padding(.top)
                    
                    Chart(investments) { investment in
                        SectorMark(
                            angle: .value("Valor", investment.amount),
                            innerRadius: 50,
                            outerRadius: 100
                        )
                        .foregroundStyle(by: .value("Tipo", investment.type))
                    }
                    .frame(height: 300)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                    
                    // Lista de Investimentos Detalhada
                    Text("Investimentos por Tipo")
                        .font(.headline)
                        .padding(.top)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(investments) { investment in
                            HStack {
                                Text(investment.type)
                                    .fontWeight(.medium)
                                Spacer()
                                Text(investment.amount, format: .currency(code: "BRL"))
                                    .foregroundColor(.blue)
                            }
                            Divider()
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                }
                .navigationTitle("Investimentos")
                .padding(.bottom)
            }
        }
    }
}

// Modelo de dados para um investimento
struct Investment: Identifiable {
    let id = UUID()
    let type: String
    let amount: Double
}

struct InvestmentsOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        InvestmentsOverviewView()
    }
}
