//
//  LoginView.swift
//  BuddhaStatueConversion
//
//  Created by shusuke imamura on 2024/08/15.
//

import SwiftUI

struct LoginView: View {
    @State var mail: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false

    private var eyeIcon: String {
        return showPassword ? "eye" : "eye.slash"
    }

    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    HStack(alignment: .center) {
                        Image(systemName: "envelope.fill")
                        TextField("Email", text: $mail)
                    }
                    .padding(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )

                    HStack(alignment: .center) {
                        Image(systemName: "key.fill")
                            .padding(.leading, 5)

                        if (showPassword) {
                            TextField("Password", text: $password)
                                .padding(.leading, 5)
                        } else {
                            SecureField("Password", text: $password)
                                .padding(.leading, 5)
                        }

                        Button {
                            showPassword.toggle()
                        } label: {
                            Image(systemName: eyeIcon)
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.gray, lineWidth: 1)
                    )
                }

                HStack(spacing: 0) {
                    Text("パスワードを忘れた方は")
                    Button {
                        
                    } label: {
                        Text("こちら")
                            .foregroundStyle(.blue)
                    }
                    .buttonStyle(.plain)
                }

                Button("Login") {
                    
                }
                .frame(width: .infinity)
                .buttonStyle(.borderedProminent)

                ZStack {
                    Text("or continue with")
                        .background()
                    Divider()
                        .frame(width: 200)
                }
                .padding(.bottom, 100)

                Text("まだアカウントを持っていませんか？")
                NavigationLink {
                    AccountRegisterView()
                } label: {
                    Text("アカウント作成はこちら")
                }
            }
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    LoginView()
}
