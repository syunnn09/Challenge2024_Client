//
//  LandingView.swift
//  BuddhaStatueConversion
//
//  Created by shusuke imamura on 2024/08/24.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        VStack {
            Text("あなたの銅像を覗きませんか？")
                .font(.title2)
                .bold()

            Button() {
                
            } label: {
                Text("さあ 始めよう！")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    LandingView()
}
