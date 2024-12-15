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
                Image("user-profile-placeholder")
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
            
            List {
                
                Section(header: Text("Informações Pessoais")
                            .font(.headline)
                            .foregroundColor(Color("darkPink"))) {
                    HStack {
                        Text("Nome")
                        Spacer()
                        Text("Larissa Martins Correa")
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Text("E-mail")
                        Spacer()
                        Text("larissa@mail.com")
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Text("Telefone")
                        Spacer()
                        Text("(11) 99999-9999")
                            .foregroundColor(.gray)
                    }
                    
                    Button(action: {
                    }) {
                        Text("Editar Informações")
                            .foregroundColor(Color("darkPink"))
                    }
                }
                
                Section(header: Text("Metas Financeiras")
                            .font(.headline)
                            .foregroundColor(Color("darkPink"))) {
                    HStack {
                        Text("Meta Mensal")
                        Spacer()
                        Text("R$ 5.000,00")
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Text("Meta de Economia")
                        Spacer()
                        Text("R$ 20.000,00")
                            .foregroundColor(.gray)
                    }
                    
                    Button(action: {
                    }) {
                        Text("Editar Metas")
                            .foregroundColor(Color("darkPink"))
                    }
                }
                
                Section(header: Text("Preferências")
                            .font(.headline)
                            .foregroundColor(Color("darkPink"))) {
                    Toggle(isOn: .constant(true)) {
                        Text("Notificações de Gastos")
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color("darkPink")))
                    
                    Toggle(isOn: .constant(true)) {
                        Text("Alertas de Economia")
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color("darkPink")))
                    
                    Button(action: {
                    }) {
                        Text("Configurar Notificações")
                            .foregroundColor(Color("darkPink"))
                    }
                }
                
                Section(header: Text("Segurança")
                            .font(.headline)
                            .foregroundColor(Color("darkPink"))) {
                    Button(action: {
                    }) {
                        Text("Alterar Senha")
                            .foregroundColor(Color("darkPink"))
                    }
                    
                    Button(action: {
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
