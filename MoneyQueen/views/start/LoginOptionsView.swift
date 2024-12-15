//  LoginOptionsView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 11/11/24.
//

import SwiftUI

struct LoginOptionsView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("darkPink")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("Bem-vinda ao Money Queen")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 60)
                
                Spacer()
                
                Button(action: {
                }) {
                    HStack {
                        Image(systemName: "wand.and.stars")
                            .font(.title2)
                            .foregroundColor(.white)
                        Text("Acessar sem Cadastro")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .textCase(.lowercase)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("lightPink"))
                    .cornerRadius(12)
                    .shadow(radius: 5)
                }
                .padding(.horizontal, 40)

                Button(action: {
                }) {
                    HStack {
                        Image(systemName: "person.crop.circle")
                            .font(.title2)
                            .foregroundColor(.white)
                        Text("Login")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .textCase(.lowercase)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("pink"))
                    .cornerRadius(12)
                    .shadow(radius: 5)
                }
                .padding(.horizontal, 40)

                Button(action: {
                }) {
                    HStack {
                        Image(systemName: "pencil")
                            .font(.title2)
                            .foregroundColor(.white)
                        Text("Registrar")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .textCase(.lowercase)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("lightPink"))
                    .cornerRadius(12)
                    .shadow(radius: 5)
                }
                .padding(.horizontal, 40)

                Spacer()
                
                Text("Use rosa às quartas-feiras!")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.bottom, 30)
            }
        }
    }
}

struct LoginOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        LoginOptionsView()
    }
}
