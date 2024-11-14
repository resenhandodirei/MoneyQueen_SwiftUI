//
//  BillReminderView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 14/11/24.
//

import SwiftUI

struct BillReminderView: View {
    @State private var reminders: [BillReminder] = []
    @State private var showingAddReminder = false

    var body: some View {
        NavigationView {
            VStack {
                if reminders.isEmpty {
                    Text("Nenhum lembrete de conta")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List(reminders) { reminder in
                        ReminderRow(reminder: reminder)
                    }
                }
            }
            .navigationTitle("Lembretes de Contas")
            .navigationBarItems(trailing: Button(action: {
                showingAddReminder = true
            }) {
                Image(systemName: "plus")
                    .foregroundColor(Color("darkPink"))
            })
            .sheet(isPresented: $showingAddReminder) {
                AddReminderView(reminders: $reminders)
            }
        }
    }
}

// Modelo de dados para um lembrete de conta
struct BillReminder: Identifiable {
    let id = UUID()
    var title: String
    var amount: String
    var dueDate: Date
    var notes: String
}

// Linha de exibição para cada lembrete de conta
struct ReminderRow: View {
    var reminder: BillReminder
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(reminder.title)
                    .font(.headline)
                Text("R$ \(reminder.amount)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Vencimento: \(reminder.dueDate, formatter: dateFormatter)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

// Tela para adicionar um novo lembrete de conta
struct AddReminderView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var reminders: [BillReminder]

    @State private var title: String = ""
    @State private var amount: String = ""
    @State private var dueDate: Date = Date()
    @State private var notes: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Detalhes da Conta")) {
                    TextField("Título", text: $title)
                    TextField("Valor (R$)", text: $amount)
                        .keyboardType(.decimalPad)
                    DatePicker("Data de Vencimento", selection: $dueDate, displayedComponents: .date)
                    TextField("Notas", text: $notes)
                }
            }
            .navigationTitle("Adicionar Lembrete")
            .navigationBarItems(leading: Button("Cancelar") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Salvar") {
                let newReminder = BillReminder(title: title, amount: amount, dueDate: dueDate, notes: notes)
                reminders.append(newReminder)
                presentationMode.wrappedValue.dismiss()
            })
        }.foregroundColor(.darkPink)
    }
}

// Formatter para exibir a data
let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter

}()

struct BillReminderView_Previews: PreviewProvider {
    static var previews: some View {
        BillReminderView()
    }
}
