//
//  NotificationsView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 14/11/24.
//

import SwiftUI

struct NotificationsView: View {
    // Dados fictícios para simulação de notificações
    let notifications = [
        NotificationItem(title: "Lembrete de Pagamento", message: "Seu pagamento de cartão vence amanhã.", date: "13/11/24"),
        NotificationItem(title: "Objetivo de Economia", message: "Você atingiu 50% do seu objetivo de viagem.", date: "10/11/24"),
        NotificationItem(title: "Nova Transação", message: "Gasto detectado no valor de R$ 150,00 na categoria Alimentação.", date: "09/11/24"),
        NotificationItem(title: "Orçamento Excedido", message: "Você excedeu o orçamento para Entretenimento este mês.", date: "07/11/24")
    ]
    
    var body: some View {
        NavigationView {
            List(notifications) { notification in
                VStack(alignment: .leading, spacing: 5) {
                    Text(notification.title)
                        .font(.headline)
                        .foregroundColor(.pink)
                    
                    Text(notification.message)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text(notification.date)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 8)
            }
            .navigationTitle("Notificações")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        // Ação de limpar notificações
                    }) {
                        Text("Limpar Tudo")
                            .foregroundColor(.pink)
                    }
                }
            }
        }
    }
}

// Estrutura do modelo para itens de notificação
struct NotificationItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let date: String
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
