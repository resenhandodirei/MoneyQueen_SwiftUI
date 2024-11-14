//
//  FinancialCoachingView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 14/11/24.
//

import SwiftUI

struct CoachingSession: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var duration: String
    var icon: String
    var isBooked: Bool
}

struct FinancialCoachingView: View {
    @State private var sessions: [CoachingSession] = [
        CoachingSession(title: "Introdução ao Planejamento Financeiro", description: "Aprenda o básico sobre como organizar suas finanças, criar um orçamento e manter um controle sobre seus gastos.", duration: "45 min", icon: "calendar", isBooked: false),
        CoachingSession(title: "Investimentos para Iniciantes", description: "Sessão introdutória sobre investimentos, abordando as opções mais seguras e estratégias de baixo risco.", duration: "1 hora", icon: "chart.bar.doc.horizontal", isBooked: false),
        CoachingSession(title: "Como Quitar Dívidas Rapidamente", description: "Dicas e estratégias práticas para quitar suas dívidas de forma rápida e eficiente.", duration: "30 min", icon: "creditcard.fill", isBooked: false),
        CoachingSession(title: "Economizando para Grandes Objetivos", description: "Saiba como poupar para grandes metas financeiras, como viagens, compra de um imóvel, ou aposentadoria.", duration: "50 min", icon: "house.fill", isBooked: false)
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Sessões de Coaching Financeiro")
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
                
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(sessions) { session in
                            CoachingSessionRow(session: session)
                        }
                    }
                    .padding()
                }
                
                Spacer()
                
                VStack {
                    Text("Precisa de ajuda personalizada?")
                        .font(.headline)
                        .padding(.top)
                    
                    Button(action: {
                        // Ação para iniciar uma consulta personalizada
                    }) {
                        Text("Agendar Consulta Personalizada")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.purple)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Coaching Financeiro", displayMode: .inline)
        }
    }
}

struct CoachingSessionRow: View {
    @State var session: CoachingSession
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: session.icon)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.purple)
                
                VStack(alignment: .leading) {
                    Text(session.title)
                        .font(.headline)
                        .foregroundColor(.purple)
                    
                    Text(session.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                    Text("Duração: \(session.duration)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Button(action: {
                    session.isBooked.toggle()
                }) {
                    Text(session.isBooked ? "Reservado" : "Reservar")
                        .font(.subheadline)
                        .foregroundColor(session.isBooked ? .gray : .purple)
                        .padding(6)
                        .background(session.isBooked ? Color.gray.opacity(0.2) : Color.purple.opacity(0.1))
                        .cornerRadius(8)
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
        }
    }
}

struct FinancialCoachingView_Previews: PreviewProvider {
    static var previews: some View {
        FinancialCoachingView()
    }
}
