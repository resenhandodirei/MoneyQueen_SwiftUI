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
                HStack {
                    NavigationLink(destination: ContentView()) {
                        Image(systemName: "line.3.horizontal") 
                            .foregroundColor(Color("darkPink"))
                            .frame(width: 25, height: 25)
                    }
                    Spacer()
                }
                
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
                
                Section(header: Text("Opções")
                            .font(.headline)
                            .foregroundColor(Color("darkPink"))) {
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
                
                Button(action: {
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
            
            Spacer()
            NavigationLink(destination: ContentView()) {
                Image(systemName: "line.3.horizontal")
                    .foregroundColor(Color("darkPink"))
                    .frame(width: 25, height: 25) 
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
