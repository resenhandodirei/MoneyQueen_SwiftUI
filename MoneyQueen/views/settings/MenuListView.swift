//
//  MenuListView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 13/11/24.
//
import SwiftUI

struct MenuListView: View {
    var body: some View {
        NavigationView {
            List {
                // Menu principal
                HStack {
                    NavigationLink(destination: ContentView()) {
                        Image(systemName: "line.3.horizontal") // Ícone de linhas
                            .foregroundColor(Color("darkPink"))
                            .frame(width: 25, height: 25) // Ajuste o tamanho conforme necessário
                    }
                    Spacer() // Alinha o ícone à direita
                }
                
                // Perfil do Usuário
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color("lightPink"))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Bem-vinda, Rainha!")
                            .font(.headline)
                            .foregroundColor(Color("darkPink"))
                        Text("Gerencie suas finanças com estilo!")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.vertical)
                
                // Opções do Menu
                Section(header: Text("Opções")
                            .font(.headline)
                            .foregroundColor(Color("darkPink"))) {
                    // Botões de navegação para outras funcionalidades
                    NavigationLink(destination: ProfileView()) {
                        MenuItem(icon: "person.circle", title: "Perfil")
                    }
                    
                    NavigationLink(destination: ReportsView()) {
                        MenuItem(icon: "chart.pie", title: "Relatórios")
                    }
                    
                    NavigationLink(destination: BudgetsView()) {
                        MenuItem(icon: "creditcard", title: "Orçamento")
                    }
                    
                    NavigationLink(destination: SettingsView()) {
                        MenuItem(icon: "gearshape", title: "Configurações")
                    }
                    
                    NavigationLink(destination: HelpView()) {
                        MenuItem(icon: "questionmark.circle", title: "Ajuda")
                    }
                }
                
                // Botão de Sair
                Button(action: {
                    // Ação para encerrar a sessão
                }) {
                    HStack {
                        Image(systemName: "arrow.backward.circle")
                            .foregroundColor(Color("darkPink"))
                        Text("Encerrar Sessão")
                            .foregroundColor(Color("darkPink"))
                            .font(.headline)
                    }
                }
                .padding(.vertical)
            }
            .navigationBarTitle("Menu", displayMode: .inline)
            .listStyle(InsetGroupedListStyle())
            .background(Color("lightPink").opacity(0.1))
        }
    }
}

// Componente para item do menu
struct MenuItem: View {
    var icon: String
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(Color("darkPink"))
                .frame(width: 30)
            
            Text(title)
                .foregroundColor(Color("darkPink"))
                .font(.body)
            
            Spacer() // Isso move o ícone de linhas para a direita
            
            // Adicionando o ícone de "lines" para o item de menu
            NavigationLink(destination: ContentView()) {
                Image(systemName: "line.3.horizontal") // Ícone de linhas
                    .foregroundColor(Color("darkPink"))
                    .frame(width: 25, height: 25) // Ajuste o tamanho
            }
        }
        .padding(.vertical, 5)
    }
}

// Exemplo de Preview
struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView()
    }
}
