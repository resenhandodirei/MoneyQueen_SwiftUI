//
//  SettingsView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 13/11/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    @State private var privacyModeEnabled = false
    @State private var selectedCurrency = "USD"
    @State private var selectedThemeColor = Color("lightPink")

    let currencies = ["USD", "EUR", "BRL", "GBP", "JPY"]
    let themeColors = ["lightPink", "darkPink", "wine", "gold"]

    var body: some View {
        NavigationView {
            List {
                // Seção Conta e Privacidade
                Section(header: Text("Conta e Privacidade")) {
                    Toggle(isOn: $privacyModeEnabled) {
                        Label("Modo Privado", systemImage: "lock.fill")
                    }
                    NavigationLink(destination: PrivacySettingsView()) {
                        Label("Configurações de Privacidade", systemImage: "shield.fill")
                    }
                }
                
                // Seção de Notificações
                Section(header: Text("Notificações")) {
                    Toggle(isOn: $notificationsEnabled) {
                        Label("Notificações", systemImage: "bell.fill")
                    }
                }
                
                // Seção de Preferências de Aparência
                Section(header: Text("Aparência")) {
                    Toggle(isOn: $darkModeEnabled) {
                        Label("Modo Escuro", systemImage: "moon.fill")
                    }
                    Picker("Cor do Tema", selection: $selectedThemeColor) {
                        ForEach(themeColors, id: \.self) { color in
                            Text(color.capitalized)
                                .foregroundColor(Color(color))
                        }
                    }
                }
                
                // Seção de Preferências de Moeda
                Section(header: Text("Preferências de Moeda")) {
                    Picker("Moeda", selection: $selectedCurrency) {
                        ForEach(currencies, id: \.self) { currency in
                            Text(currency)
                        }
                    }
                }
                
                // Seção Sobre o App
                Section(header: Text("Sobre")) {
                    NavigationLink(destination: AboutView()) {
                        Label("Sobre o Money Queen", systemImage: "info.circle.fill")
                    }
                    NavigationLink(destination: HelpView()) {
                        Label("Ajuda", systemImage: "questionmark.circle.fill")
                    }
                    NavigationLink(destination: LegalInfoView()) {
                        Label("Informações Legais", systemImage: "doc.text.fill")
                    }
                }
                
                // Seção de Sair
                Section {
                    Button(action: {
                        // Ação de Logout
                    }) {
                        HStack {
                            Spacer()
                            Text("Sair")
                                .fontWeight(.semibold)
                                .foregroundColor(.red)
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Configurações")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(InsetGroupedListStyle())
        }
    }
}

// Sub-view para Configurações de Privacidade
struct PrivacySettingsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Configurações de Privacidade")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text("Aqui você pode gerenciar suas configurações de privacidade.")
                .font(.body)
                .padding(.horizontal)
            
            // Adicione mais detalhes e opções de privacidade aqui
            Spacer()
        }
        .navigationTitle("Privacidade")
    }
}

// Sub-view para Informações Legais
struct LegalInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Informações Legais")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text("Aqui você encontra os termos de uso e a política de privacidade.")
                .font(.body)
                .padding(.horizontal)
            
            // Adicione os textos de informações legais aqui
            Spacer()
        }
        .navigationTitle("Informações Legais")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
