//
//  NotificationsView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 14/11/24.
//

import SwiftUI

struct NotificationsView: View {
    // Dados fictícios para simulação de notificações
    @State private var notifications = [
        NotificationItem(title: "Lembrete de Pagamento", message: "Seu pagamento de cartão vence amanhã.", date: "13/11/24", isRead: false),
        NotificationItem(title: "Objetivo de Economia", message: "Você atingiu 50% do seu objetivo de viagem.", date: "10/11/24", isRead: false),
        NotificationItem(title: "Nova Transação", message: "Gasto detectado no valor de R$ 150,00 na categoria Alimentação.", date: "09/11/24", isRead: false),
        NotificationItem(title: "Orçamento Excedido", message: "Você excedeu o orçamento para Entretenimento este mês.", date: "07/11/24", isRead: false)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(notifications) { notification in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(notification.title)
                            .font(.headline)
                            .foregroundColor(notification.isRead ? .gray : .darkPink)
                            .onTapGesture {
                                markAsRead(notification: notification)
                            }
                        
                        Text(notification.message)
                            .font(.subheadline)
                            .foregroundColor(notification.isRead ? .gray : .secondary)
                        
                        Text(notification.date)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 8)
                    .background(notification.isRead ? Color(UIColor.systemGray6) : Color.white)
                    .cornerRadius(8)
                }
                .onDelete(perform: deleteNotification)
            }
            .navigationTitle("Notificações")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        clearNotifications()
                    }) {
                        Text("Limpar Tudo")
                            .foregroundColor(.darkPink)
                    }
                }
            }
        }
    }
    
    // Função para marcar notificação como lida
    private func markAsRead(notification: NotificationItem) {
        if let index = notifications.firstIndex(where: { $0.id == notification.id }) {
            notifications[index].isRead.toggle()
        }
    }
    
    // Função para deletar uma notificação
    private func deleteNotification(at offsets: IndexSet) {
        notifications.remove(atOffsets: offsets)
    }
    
    // Função para limpar todas as notificações
    private func clearNotifications() {
        notifications.removeAll()
    }
}

// Estrutura do modelo para itens de notificação
struct NotificationItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let date: String
    var isRead: Bool 
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}

