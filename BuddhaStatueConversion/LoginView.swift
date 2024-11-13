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
    @State var isLogin: Bool = false
    
    private var eyeIcon: String {
        return showPassword ? "eye" : "eye.slash"
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                GeometryReader { geometry in
                    let offset = geometry.frame(in: .global).minY
                    let adjustedOffset = offset > 0 ? -offset : 0

                    ZStack {
                        Image("Login")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: 280 + adjustedOffset)
                            .offset(y: adjustedOffset)
                            .clipped()
                        
                        VStack {
                            Text("Buddha Statue")
                                .font(.title)
                                .padding(.bottom, 5)
                            
                            Text("We transform you into a Buddha statue")
                        }
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .offset(y: adjustedOffset)
                    }
                }
                .frame(height: 280)

                VStack(spacing: 20) {
                    Text("Login")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 30)
                    
                    VStack(spacing: 30) {
                        HStack(alignment: .center) {
                            Image(systemName: "envelope.fill")
                                .foregroundStyle(.gray)
                            TextField("Email", text: $mail)
                        }
                        .padding(15)
                        .background(Color(uiColor: .systemBackground))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                        
                        HStack(alignment: .center) {
                            Image(systemName: "key.fill")
                                .foregroundStyle(.gray)
                            
                            if showPassword {
                                TextField("Password", text: $password)
                            } else {
                                SecureField("Password", text: $password)
                            }
                            
                            Button {
                                showPassword.toggle()
                            } label: {
                                Image(systemName: eyeIcon)
                                    .foregroundStyle(.gray)
                            }
                        }
                        .padding(15)
                        .background(Color(uiColor: .systemBackground))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
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
                    .underline()
                    .padding(.top, 5)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Button {
                        isLogin = true
                    } label: {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.black)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    .buttonStyle(.plain)
                    .navigationDestination(isPresented: $isLogin) {
                        LandingView()
                    }
                    
                    VStack(spacing: 15) {
                        ZStack {
                            Divider()
                            Text("or continue with")
                                .padding(.horizontal)
                                .background(Color(uiColor: .systemBackground))
                        }
                        .padding(.vertical, 20)
                        
                        Button {
                            
                        } label: {
                            HStack {
                                Image(systemName: "g.circle.fill")
                                Text("Continue with Google")
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        }
                        .buttonStyle(.plain)
                        
                        VStack(spacing: 0) {
                            Text("まだアカウントを持っていませんか？")
                            NavigationLink {
                                AccountRegisterView()
                            } label: {
                                Text("アカウント作成はこちら")
                                    .foregroundStyle(.blue)
                                    .underline()
                            }
                        }
                        .padding(.top, 20)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.vertical)
                .background(Color(uiColor: .systemBackground))
                .clipShape(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                )
                .offset(y: -30)
            }
            .scrollDisabled(true)
            .ignoresSafeArea(edges: .top)
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
    LoginView()
}
