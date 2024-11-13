//
//  LandingView2.swift
//  BuddhaStatueConversion
//
//  Created by shusuke imamura on 2024/08/24.
//

import SwiftUI

struct LandingView2: View {
    @State var goNext = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                Image("landing2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .padding(.bottom, 30)

                Text("あなたの銅像を覗きませんか？")
                    .font(.title2)
                    .bold()

                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Utelm enim ad minim veniam,")
                    .padding()

                Spacer()

                PrimaryButton(title: "さあ、始めよう！") {
                    goNext = true
                }
                .navigationDestination(isPresented: $goNext) {
                    HomeView()
                }
                .padding(.bottom, 35)

                Spacer()
            }
            .navigationBarBackButtonHidden()
        }
        .onAppear {
            ToolbarManager.shared.isHidden = true
        }
        .onDisappear {
            ToolbarManager.shared.isHidden = false
        }
    }
}

#Preview {
    LandingView()
}
