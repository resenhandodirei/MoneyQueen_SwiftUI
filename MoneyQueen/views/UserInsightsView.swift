//
//  UserInsightsView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 14/11/24.
//

import SwiftUI
import Charts

struct Insight: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var icon: String
}

struct UserInsightsView: View {
    @State private var insights: [Insight] = [
        Insight(title: "Gastos Maiores no Fim do Mês", description: "Você tende a gastar mais nos últimos dias de cada mês. Considere criar um orçamento fixo para evitar surpresas!", icon: "calendar.badge.exclamationmark"),
        Insight(title: "Categoria de Gastos Dominante: Alimentação", description: "Seus maiores gastos são em alimentação, representando 35% do seu orçamento mensal. Avalie oportunidades para economizar nesta área.", icon: "cart.fill"),
        Insight(title: "Pouca Frequência em Investimentos", description: "Você está investindo menos do que a média mensal recomendada. Considere redirecionar parte de sua economia para investimentos.", icon: "chart.line.uptrend.xyaxis"),
        Insight(title: "Economia Focada nos Primeiros Dias do Mês", description: "Você economiza mais nos primeiros dias do mês, mas tende a gastar essa reserva ao longo do mês. Tente separar uma quantia fixa e mantê-la intocada.", icon: "banknote.fill")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(insights) { insight in
                        HStack(alignment: .top, spacing: 12) {
                            Image(systemName: insight.icon)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.purple)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text(insight.title)
                                    .font(.headline)
                                    .foregroundColor(.purple)
                                Text(insight.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    }
                    
                    Divider()
                        .padding(.vertical)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Análise de Gastos por Categoria")
                            .font(.title2)
                            .bold()
                            .padding(.leading)
                        
                        SpendingCategoryChartView()
                            .frame(height: 250)
                            .padding()
                    }
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Tendência de Gastos ao Longo do Tempo")
                            .font(.title2)
                            .bold()
                            .padding(.leading)
                        
                        MonthlySpendingTrendChartView()
                            .frame(height: 250)
                            .padding()
                    }
                }
                .padding()
            }
            .navigationBarTitle("Insights Financeiros", displayMode: .inline)
        }
    }
}

struct SpendingCategoryChartView: View {
    var body: some View {
        Chart {
            BarMark(
                x: .value("Categoria", "Alimentação"),
                y: .value("Gasto", 35)
            )
            .foregroundStyle(.purple)
            
            BarMark(
                x: .value("Categoria", "Transporte"),
                y: .value("Gasto", 20)
            )
            .foregroundStyle(.blue)
            
            BarMark(
                x: .value("Categoria", "Entretenimento"),
                y: .value("Gasto", 15)
            )
            .foregroundStyle(.green)
            
            BarMark(
                x: .value("Categoria", "Saúde"),
                y: .value("Gasto", 10)
            )
            .foregroundStyle(.red)
            
            BarMark(
                x: .value("Categoria", "Outros"),
                y: .value("Gasto", 20)
            )
            .foregroundStyle(.orange)
        }
        .chartLegend(.hidden)
        .padding()
    }
}

struct MonthlySpendingTrendChartView: View {
    var body: some View {
        Chart {
            LineMark(
                x: .value("Mês", "Janeiro"),
                y: .value("Gasto", 1500)
            )
            LineMark(
                x: .value("Mês", "Fevereiro"),
                y: .value("Gasto", 1350)
            )
            LineMark(
                x: .value("Mês", "Março"),
                y: .value("Gasto", 1600)
            )
            LineMark(
                x: .value("Mês", "Abril"),
                y: .value("Gasto", 1400)
            )
            LineMark(
                x: .value("Mês", "Maio"),
                y: .value("Gasto", 1450)
            )
            LineMark(
                x: .value("Mês", "Junho"),
                y: .value("Gasto", 1550)
            )
        }
        .chartYAxisLabel("Gastos (R$)")
        .chartXAxisLabel("Meses")
        .padding()
    }
}

struct UserInsightsView_Previews: PreviewProvider {
    static var previews: some View {
        UserInsightsView()
    }
}

