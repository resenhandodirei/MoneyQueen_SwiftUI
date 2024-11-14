//
//  SubscriptionManagerView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 14/11/24.
//

import SwiftUI

struct SubscriptionManagerView: View {
    // Dados de exemplo para assinaturas
    @State private var subscriptions = [
        Subscription(name: "Netflix", amount: 29.99, renewalDate: "15 de cada mês"),
        Subscription(name: "Spotify", amount: 19.90, renewalDate: "10 de cada mês"),
        Subscription(name: "Apple Music", amount: 16.90, renewalDate: "20 de cada mês"),
        Subscription(name: "Adobe Creative Cloud", amount: 119.90, renewalDate: "1 de cada mês")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // Header da tela
                Text("Assinaturas")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("wine"))
                    .padding(.top, 20)
                
                // Lista de assinaturas
                List {
                    ForEach(subscriptions) { subscription in
                        SubscriptionRow(subscription: subscription)
                    }
                    .onDelete(perform: deleteSubscription)
                }
                .listStyle(InsetGroupedListStyle())
                
                // Botão para adicionar nova assinatura
                Button(action: {
                    // Ação para adicionar nova assinatura
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Adicionar Assinatura")
                            .fontWeight(.semibold)
                    }
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("darkPink"))
                    .cornerRadius(12)
                    .shadow(radius: 5)
                }
                .padding(.bottom, 20)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // Função para deletar uma assinatura
    func deleteSubscription(at offsets: IndexSet) {
        subscriptions.remove(atOffsets: offsets)
    }
}

// Estrutura da assinatura
struct Subscription: Identifiable {
    let id = UUID()
    var name: String
    var amount: Double
    var renewalDate: String
}

// Linha de cada assinatura na lista
struct SubscriptionRow: View {
    var subscription: Subscription
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(subscription.name)
                    .font(.headline)
                    .foregroundColor(Color("wine"))
                Text("Renovação: \(subscription.renewalDate)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(String(format: "R$ %.2f", subscription.amount))
                .fontWeight(.bold)
                .foregroundColor(Color("darkPink"))
        }
        .padding(.vertical, 8)
    }
}

struct SubscriptionManagerView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionManagerView()
    }
}
