//
//  FinancialAchievementsView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 14/11/24.
//

import SwiftUI

struct FinancialAchievementsView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Conquistas Financeiras")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("wine"))

                Text("Acompanhe suas conquistas e celebre seu progresso financeiro!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                ScrollView {
                    VStack(spacing: 20) {
                        AchievementRow(title: "Primeiro Objetivo Atingido", description: "Parabéns por completar sua primeira meta financeira!", icon: "star.fill")
                        
                        AchievementRow(title: "Economias de Emergência", description: "Você conseguiu acumular um fundo de emergência!", icon: "umbrella.fill")
                        
                        AchievementRow(title: "Investidor Iniciante", description: "Você começou a investir para o seu futuro!", icon: "chart.bar.fill")
                        
                        AchievementRow(title: "Controle de Gastos", description: "Manteve-se dentro do orçamento por 3 meses consecutivos.", icon: "checkmark.seal.fill")
                        
                        AchievementRow(title: "Score de Crédito Excelente", description: "Seu score de crédito alcançou 750 pontos!", icon: "creditcard.fill")
                        
                        AchievementRow(title: "Rainha das Finanças", description: "Parabéns, você alcançou todas as suas metas financeiras!", icon: "crown.fill")
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
            }
//            .padding()
//            .navigationTitle("Conquistas")
        }
    }
}

// Componente para cada conquista
struct AchievementRow: View {
    var title: String
    var description: String
    var icon: String

    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Image(systemName: icon)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(Color("darkPink"))
                .padding(10)
                .background(Color("lightPink"))
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)

                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.9))
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

struct FinancialAchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        FinancialAchievementsView()
    }
}
