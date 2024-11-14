//
//  LoanManagerView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 14/11/24.
//

import SwiftUI

struct Loan: Identifiable {
    let id = UUID()
    let name: String
    var principal: Double
    var interestRate: Double
    var totalPaid: Double
    var monthlyPayment: Double
}

struct LoanManagerView: View {
    @State private var loans: [Loan] = []
    @State private var isAddingLoan = false
    @State private var newLoanName = ""
    @State private var newPrincipal: String = ""
    @State private var newInterestRate: String = ""
    @State private var newMonthlyPayment: String = ""

    var body: some View {
        NavigationView {
            VStack {
                if loans.isEmpty {
                    Text("Nenhum empréstimo cadastrado.")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(loans) { loan in
                            VStack(alignment: .leading) {
                                Text(loan.name)
                                    .font(.headline)
                                HStack {
                                    Text("Saldo inicial:")
                                    Spacer()
                                    Text("R$ \(loan.principal, specifier: "%.2f")")
                                }
                                HStack {
                                    Text("Juros (%):")
                                    Spacer()
                                    Text("\(loan.interestRate, specifier: "%.2f")%")
                                }
                                HStack {
                                    Text("Pagamentos mensais:")
                                    Spacer()
                                    Text("R$ \(loan.monthlyPayment, specifier: "%.2f")")
                                }
                                HStack {
                                    Text("Total pago:")
                                    Spacer()
                                    Text("R$ \(loan.totalPaid, specifier: "%.2f")")
                                }
                            }
                            .padding(.vertical, 5)
                        }
                        .onDelete(perform: deleteLoan)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    isAddingLoan = true
                }) {
                    Text("Adicionar Empréstimo")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("darkPink"))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .shadow(radius: 5)
                }
                .sheet(isPresented: $isAddingLoan) {
                    AddLoanView(isAddingLoan: $isAddingLoan, loans: $loans)
                }
            }
            .navigationTitle("Gerenciador de Empréstimos")
        }
    }
    
    private func deleteLoan(at offsets: IndexSet) {
        loans.remove(atOffsets: offsets)
    }
}

struct AddLoanView: View {
    @Binding var isAddingLoan: Bool
    @Binding var loans: [Loan]
    
    @State private var loanName = ""
    @State private var principal = ""
    @State private var interestRate = ""
    @State private var monthlyPayment = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Informações do Empréstimo")) {
                    TextField("Nome do Empréstimo", text: $loanName)
                    TextField("Valor Inicial (Principal)", text: $principal)
                        .keyboardType(.decimalPad)
                    TextField("Taxa de Juros (%)", text: $interestRate)
                        .keyboardType(.decimalPad)
                    TextField("Pagamento Mensal", text: $monthlyPayment)
                        .keyboardType(.decimalPad)
                }
                
                Button(action: saveLoan) {
                    Text("Salvar Empréstimo")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("darkPink"))
                        .cornerRadius(12)
                }
                .disabled(loanName.isEmpty || principal.isEmpty || interestRate.isEmpty || monthlyPayment.isEmpty)
            }
            .navigationTitle("Novo Empréstimo")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        isAddingLoan = false
                    }
                }
            }
        }
    }
    
    private func saveLoan() {
        guard let principalAmount = Double(principal),
              let interest = Double(interestRate),
              let payment = Double(monthlyPayment) else { return }
        
        let newLoan = Loan(
            name: loanName,
            principal: principalAmount,
            interestRate: interest,
            totalPaid: 0.0,
            monthlyPayment: payment
        )
        
        loans.append(newLoan)
        isAddingLoan = false
    }
}

struct LoanManagerView_Previews: PreviewProvider {
    static var previews: some View {
        LoanManagerView()
    }
}
