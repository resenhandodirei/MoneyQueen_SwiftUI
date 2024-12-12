//
//  StartView.swift
//  MoneyQueen
//
//  Created by Larissa Martins Correa on 11/11/24.
//

import SwiftUI

struct StartView: View {
    @State private var showingOnboarding = false 

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("darkPink")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(spacing: 40) {
                ZStack {
                    HStack(alignment: .center) {
                        Text("Money Queen")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    
                    Image("icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .offset(x: -100, y: -50)
                        .rotationEffect(.degrees(-14))
                }
                .padding()
                
                Button(action: {
                    showingOnboarding = true
                }) {
                    Text("Acessar")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.darkPink)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("nude"))
                        .cornerRadius(12)
                        .shadow(radius: 5)
                        .textCase(.lowercase)
                }
                .padding(.horizontal, 40)
            }
            .padding()
        }
        
        .sheet(isPresented: $showingOnboarding) {
            OnboardingView(showingOnboarding: $showingOnboarding)
        }
    }
}

// Tela de Introdução (onboarding) em várias páginas
struct OnboardingView: View {
    @Binding var showingOnboarding: Bool

    let pages = [
        "Bem-vindo ao Money Queen!",
        "Gerencie suas finanças com estilo!",
        "Receba alertas sobre suas despesas!",
        "Deslize para começar!"
    ]

    @State private var currentPage = 0

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<pages.count, id: \.self) { index in
                    VStack {
                        Text(pages[index])
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .padding()
                            .multilineTextAlignment(.center)
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color.white.opacity(0.7))
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .background(Color("lightPink"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()

            Button(action: {
                showingOnboarding = false
            }) {
                Text("Começar")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("darkPink"))
                    .cornerRadius(10)
            }
            .padding(.top, 20)
        }
        .frame(width: 300, height: 400)
        .background(Color("wine").opacity(0.8))
        .cornerRadius(20)
        .shadow(radius: 10)
        .transition(.scale)
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

