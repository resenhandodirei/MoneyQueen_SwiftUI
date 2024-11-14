//
//  AboutView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 13/11/24.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Título e ícone do app
                VStack {
                    Image("icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding(.top, 20)
                    
                    Text("Sobre o Money Queen")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("wine"))
                }
                
                // Descrição do aplicativo
                VStack(alignment: .leading, spacing: 10) {
                    Text("Nosso Propósito")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("darkPink"))
                    
                    Text("O Money Queen é um aplicativo criado para ajudar você a gerenciar suas finanças de forma prática e empoderada. Inspirado em uma estética divertida e elegante, nosso objetivo é tornar o controle financeiro acessível e, acima de tudo, empoderador.")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal)
                
                // Funcionalidades do App
                VStack(alignment: .leading, spacing: 10) {
                    Text("Funcionalidades")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("darkPink"))
                    
                    VStack(alignment: .leading, spacing: 5) {
                        FeatureItemView(feature: "Gestão de Orçamentos", description: "Crie e acompanhe seus orçamentos para diferentes categorias de despesas.")
                        FeatureItemView(feature: "Alertas de Despesas", description: "Receba notificações sobre gastos e mantenha o controle financeiro.")
                        FeatureItemView(feature: "Relatórios Visuais", description: "Visualize seus gastos em gráficos elegantes e detalhados.")
                        FeatureItemView(feature: "Planejamento Financeiro", description: "Planeje seu futuro financeiro e seja a rainha das suas finanças.")
                    }
                }
                .padding(.horizontal)
                
                // Sobre a equipe
                VStack(alignment: .leading, spacing: 10) {
                    Text("Nossa Equipe")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("darkPink"))
                    
                    Text("O Money Queen foi desenvolvido por uma equipe dedicada a criar soluções digitais para o empoderamento financeiro. Cada detalhe foi pensado para que você tenha uma experiência intuitiva e divertida.")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                    
                    HStack {
                        TeamMemberView(name: "Larissa Martins Correa", role: "Desenvolvedora iOS", imageName: "larissa")
                        TeamMemberView(name: "João Silva", role: "Designer UI/UX", imageName: "joao")
                        TeamMemberView(name: "Ana Oliveira", role: "Gerente de Produto", imageName: "ana")
                    }
                    .padding(.top, 10)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Sobre")
    }
}

struct FeatureItemView: View {
    var feature: String
    var description: String

    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "star.fill")
                .foregroundColor(Color("darkPink"))
                .padding(.top, 3)
            
            VStack(alignment: .leading) {
                Text(feature)
                    .font(.headline)
                    .foregroundColor(Color("wine"))
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct TeamMemberView: View {
    var name: String
    var role: String
    var imageName: String

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            
            Text(name)
                .font(.headline)
                .foregroundColor(Color("wine"))
            
            Text(role)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
