//
//  LandingView.swift
//  BuddhaStatueConversion
//
//  Created by shusuke imamura on 2024/08/24.
//

import SwiftUI

struct LandingView: View {
    @State var goNext = false
    @State var skipped = false

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                Image("landing1")
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

                PrimaryButton(title: "続ける") {
                    goNext = true
                }
                .navigationDestination(isPresented: $goNext) {
                    LandingView2()
                }
                .padding(.bottom, 10)

                Button {
                    skipped = true
                } label: {
                    Text("スキップする")
                        .foregroundStyle(Color(hex: "555555"))
                }
                .buttonStyle(.plain)
                .navigationDestination(isPresented: $skipped) {
                    HomeView()
                }

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
