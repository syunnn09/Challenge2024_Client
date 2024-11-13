//
//  ProfileView.swift
//  BuddhaStatueConversion
//
//  Created by shusuke imamura on 2024/11/14.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Circle()
                        .frame(width: 100, height: 100)
                    
                    VStack {
                        Text("小山田 しゅうすけ")
                        Text("日本")
                    }
                }
                
                NavigationLink("プロフィールを編集する") {
                    
                }.buttonStyle(ProfileButtonStyle())

                NavigationLink("パスワードを変更する") {
                    
                }

                NavigationLink("撮影した写真を見る") {
                    
                }
            }
        }
    }
}

struct ProfileButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.red, lineWidth: 4)
            )
    }
}

#Preview {
    ProfileView()
}
