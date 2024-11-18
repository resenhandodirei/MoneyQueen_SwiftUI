//
//  ProfileView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 13/11/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Foto e Saudação
            VStack {
                Image("user-profile-placeholder") // Substitua pelo nome da imagem de perfil do usuário
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color("lightPink"), lineWidth: 4))
                    .shadow(radius: 5)
                
                Text("Olá, Rainha!")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color("wine"))
                
                Text("Seu reino financeiro espera!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.top, 40)
            
            // Seções do Perfil
            List {
                // Informações do Usuário
                Section(header: Text("Informações Pessoais")
                            .font(.headline)
                            .foregroundColor(Color("darkPink"))) {
                    HStack {
                        Text("Nome")
                        Spacer()
                        Text("Larissa Martins Correa") // Exemplo, pode ser dinâmico
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Text("E-mail")
                        Spacer()
                        Text("larissa@mail.com") // Exemplo, pode ser dinâmico
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Text("Telefone")
                        Spacer()
                        Text("(11) 99999-9999") // Exemplo, pode ser dinâmico
                            .foregroundColor(.gray)
                    }
                    
                    Button(action: {
                        // Ação para editar informações pessoais
                    }) {
                        Text("Editar Informações")
                            .foregroundColor(Color("darkPink"))
                    }
                }
                
                // Metas Financeiras
                Section(header: Text("Metas Financeiras")
                            .font(.headline)
                            .foregroundColor(Color("darkPink"))) {
                    HStack {
                        Text("Meta Mensal")
                        Spacer()
                        Text("R$ 5.000,00") // Exemplo, pode ser dinâmico
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Text("Meta de Economia")
                        Spacer()
                        Text("R$ 20.000,00") // Exemplo, pode ser dinâmico
                            .foregroundColor(.gray)
                    }
                    
                    Button(action: {
                        // Ação para editar metas financeiras
                    }) {
                        Text("Editar Metas")
                            .foregroundColor(Color("darkPink"))
                    }
                }
                
                // Preferências
                Section(header: Text("Preferências")
                            .font(.headline)
                            .foregroundColor(Color("darkPink"))) {
                    // Customizando o Toggle para usar a cor darkPink
                    Toggle(isOn: .constant(true)) {
                        Text("Notificações de Gastos")
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color("darkPink"))) // Cor personalizada do Toggle
                    
                    Toggle(isOn: .constant(true)) {
                        Text("Alertas de Economia")
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color("darkPink"))) // Cor personalizada do Toggle
                    
                    Button(action: {
                        // Ação para ajustar notificações
                    }) {
                        Text("Configurar Notificações")
                            .foregroundColor(Color("darkPink"))
                    }
                }
                
                // Segurança
                Section(header: Text("Segurança")
                            .font(.headline)
                            .foregroundColor(Color("darkPink"))) {
                    Button(action: {
                        // Ação para alterar senha
                    }) {
                        Text("Alterar Senha")
                            .foregroundColor(Color("darkPink"))
                    }
                    
                    Button(action: {
                        // Ação para habilitar autenticação biométrica
                    }) {
                        Text("Ativar Autenticação Biométrica")
                            .foregroundColor(Color("darkPink"))
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
        .navigationTitle("Perfil")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
