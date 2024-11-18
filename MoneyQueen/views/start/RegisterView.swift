//
//  RegisterView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 13/11/24.
//

import SwiftUI

struct RegisterView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        ZStack {
            // Fundo em gradiente rosa
            LinearGradient(gradient: Gradient(colors: [Color("darkPink")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                // Título da tela
                VStack {
                    Text("Seja uma")
                        .font(.title)
                        .foregroundColor(.white)
                    Text("Money Queen")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.top, 40)

                // Campo de nome
                CustomTextField(placeholder: "Nome", text: $name)
                
                // Campo de e-mail
                CustomTextField(placeholder: "E-mail", text: $email, keyboardType: .emailAddress)
                
                // Campo de senha
                CustomTextField(placeholder: "Senha", text: $password, isSecure: true)
                
                // Campo de confirmação de senha
                CustomTextField(placeholder: "Confirme sua senha", text: $confirmPassword, isSecure: true)
                
                // Botão de Registrar
                Button(action: {
                    // Ação ao clicar no botão registrar
                }) {
                    Text("Registrar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("pink"))
                        .cornerRadius(12)
                        .shadow(radius: 5)
                }
                .padding(.horizontal, 40)
                .padding(.top, 20)
                
                Spacer()
            }
            .padding()
        }
    }
}

// CustomTextField para reutilização
struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    var isSecure: Bool = false
    
    var body: some View {
        Group {
            if isSecure {
                SecureField(placeholder, text: $text)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .font(.headline)
            } else {
                TextField(placeholder, text: $text)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .font(.headline)
                    .keyboardType(keyboardType)
            }
        }
        .padding(.horizontal, 40)
        .shadow(radius: 5)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

