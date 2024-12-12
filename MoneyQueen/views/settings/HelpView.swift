//
//  HelpView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 13/11/24.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Ajuda e Suporte")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("darkPink"))
            
            Text("Como podemos ajudar você a reinar sobre suas finanças?")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            List {
                Section(header: Text("Perguntas Frequentes")
                            .font(.headline)
                            .foregroundColor(Color("darkPink"))) {
                    FAQRow(question: "Como criar uma meta financeira?", answer: "No seu perfil, selecione 'Metas Financeiras' e insira os valores que deseja economizar ou gastar.")
                    
                    FAQRow(question: "Como ativar notificações?", answer: "Em 'Preferências' no perfil, ative as opções de notificações para receber alertas personalizados.")
                    
                    FAQRow(question: "O que fazer se esquecer minha senha?", answer: "Na tela de login, selecione 'Esqueci minha senha' e siga as instruções para recuperá-la.")
                    
                    FAQRow(question: "Como editar meu perfil?", answer: "Vá até 'Informações Pessoais' no seu perfil e selecione 'Editar Informações'.")
                }
                
                Section(header: Text("Contato com Suporte")
                            .font(.headline)
                            .foregroundColor(Color("darkPink"))) {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("darkPink"))
                        Text("Enviar um e-mail para suporte")
                            .foregroundColor(.blue)
                    }
                    .onTapGesture {
                    }
                    
                    HStack {
                        Image(systemName: "phone.fill")
                            .foregroundColor(Color("darkPink"))
                        Text("Ligar para o suporte")
                            .foregroundColor(.blue)
                    }
                    .onTapGesture {
                    }
                }
                
                Section(header: Text("Links Úteis")
                            .font(.headline)
                            .foregroundColor(Color("darkPink"))) {
                    Link("Guia de Introdução ao Money Queen", destination: URL(string: "https://www.moneyqueenapp.com/guia")!)
                    
                    Link("Política de Privacidade", destination: URL(string: "https://www.moneyqueenapp.com/privacidade")!)
                    
                    Link("Termos de Uso", destination: URL(string: "https://www.moneyqueenapp.com/termos")!)
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
        .padding()
        .navigationTitle("Ajuda")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FAQRow: View {
    var question: String
    var answer: String
    @State private var isExpanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(question)
                    .font(.headline)
                    .foregroundColor(Color("darkPink"))
                Spacer()
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(Color.gray)
            }
            .onTapGesture {
                withAnimation {
                    isExpanded.toggle()
                }
            }
            
            if isExpanded {
                Text(answer)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                    .padding(.top, 5)
            }
        }
        .padding(.vertical, 5)
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
