//
//  CreditScoreView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 14/11/24.
//

import SwiftUI

struct CreditScoreView: View {
    @State private var creditScore: Int = 650 // Exemplo de valor inicial do score
    private let maxScore = 850 // Máximo valor do score de crédito

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                // Título e breve descrição
                Text("Score de Crédito")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("wine"))

                Text("Monitore seu score de crédito e descubra como melhorá-lo!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                // Indicador de Score de Crédito
                CreditScoreIndicator(creditScore: creditScore, maxScore: maxScore)
                    .padding(.vertical, 20)

                // Análise personalizada do score
                CreditScoreAnalysis(creditScore: creditScore)
                    .padding(.vertical, 20)
                
                // Dicas para melhorar o Score
                VStack(alignment: .leading, spacing: 15) {
                    Text("Dicas para Melhorar Seu Score")
                        .font(.headline)
                        .foregroundColor(Color("darkPink"))
                    
                    TipRow(tip: "Pague suas contas em dia para evitar dívidas.")
                    TipRow(tip: "Reduza o uso do limite de crédito.")
                    TipRow(tip: "Evite abrir várias linhas de crédito em curto prazo.")
                    TipRow(tip: "Monitore seu score regularmente.")
                }
                .padding()

                Spacer()
            }
            .padding()
        }
    }
}

// Componente para representar visualmente o score
struct CreditScoreIndicator: View {
    var creditScore: Int
    var maxScore: Int
    
    var scorePercentage: Double {
        Double(creditScore) / Double(maxScore)
    }
    
    var body: some View {
        VStack {
            Text("Seu Score de Crédito: \(creditScore)")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)

            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 20)
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(scoreColor)
                    .frame(width: CGFloat(scorePercentage) * 300, height: 20)
                    .animation(.easeInOut(duration: 0.6), value: creditScore)
            }
            .frame(width: 300)
        }
    }
    
    // Cor do indicador com base no valor do score
    var scoreColor: Color {
        switch creditScore {
        case 0..<580:
            return Color.red
        case 580..<670:
            return Color.orange
        case 670..<740:
            return Color.yellow
        case 740..<800:
            return Color.green
        default:
            return Color.blue
        }
    }
}

// Componente para exibir cada dica como uma linha
struct TipRow: View {
    var tip: String

    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "lightbulb.fill")
                .foregroundColor(Color("darkPink"))
            Text(tip)
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
        }
    }
}

// Componente para análise personalizada do score
struct CreditScoreAnalysis: View {
    var creditScore: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Análise do Seu Score")
                .font(.headline)
                .foregroundColor(Color("darkPink"))
            
            // Texto de Feedback baseado no Score
            Text(analysisText)
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // Sugestões de Melhoria
            VStack(alignment: .leading, spacing: 10) {
                Text("Ações para Melhorar Seu Score")
                    .font(.subheadline)
                    .foregroundColor(Color("darkPink"))
                
                ForEach(suggestions, id: \.self) { suggestion in
                    Text("• \(suggestion)")
                        .font(.body)
                        .foregroundColor(.primary)
                }
            }
            .padding(.horizontal)
        }
        .padding()
    }
    
    // Determina a análise do score
    private var analysisText: String {
        switch creditScore {
        case 0..<580:
            return "Seu score está abaixo da média, o que pode dificultar a aprovação de crédito. É importante tomar medidas para melhorar."
        case 580..<670:
            return "Seu score está na média, mas ainda há espaço para melhorar. Concentre-se em reduzir suas dívidas."
        case 670..<740:
            return "Seu score é bom, mas pode ser melhorado ainda mais. Continue mantendo os pagamentos em dia!"
        case 740..<800:
            return "Excelente score! Você tem um bom histórico de crédito. Tente manter esse padrão."
        default:
            return "Parabéns! Seu score está ótimo e acima da média. Você está muito bem em termos de crédito."
        }
    }
    
    // Sugestões baseadas no score
    private var suggestions: [String] {
        switch creditScore {
        case 0..<580:
            return ["Pague suas contas em dia", "Evite abrir novas linhas de crédito", "Reduza o uso do limite de crédito"]
        case 580..<670:
            return ["Continue pagando suas contas em dia", "Tente quitar dívidas antigas", "Monitore seu score regularmente"]
        case 670..<740:
            return ["Mantenha o bom histórico de pagamento", "Considere aumentar o limite de crédito", "Evite aumentar a dívida"]
        case 740..<800:
            return ["Mantenha os hábitos financeiros positivos", "Evite fechar muitas contas de crédito", "Verifique regularmente seu score"]
        default:
            return ["Continue assim! Seu score está excelente.", "Aproveite para negociar melhores taxas de crédito."]
        }
    }
}

struct CreditScoreView_Previews: PreviewProvider {
    static var previews: some View {
        CreditScoreView()
    }
}
