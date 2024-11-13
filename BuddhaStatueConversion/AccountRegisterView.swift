//
//  AccountRegisterView.swift
//  BuddhaStatueConversion
//
//  Created by shusuke imamura on 2024/08/16.
//

import SwiftUI

struct AccountRegisterView: View {
    @State var name: String = ""
    @State var birthday: Date = .now
    @State var sex: Int = 1
    @State var zip: String = ""
    @State var prefecture: String = ""
    @State var city: String = ""
    @State var address: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var password2: String = ""

    @FocusState var isAddressFocused

    private func getAddress() {
        if zip.count == 7 {
//            AddressUtils.getAddress(zip: zip)
            prefecture = "鹿児島県"
            city = "鹿児島市紫原"
            isAddressFocused = true
        }
    }

    private func checkPassword() {
        if password != password2 {
            print("Password Error")
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .center, spacing: 25) {
                    ZStack(alignment: .center) {
                        Circle()
                            .foregroundStyle(.gray)
                            .frame(width: 100, height: 100)
                        Image(systemName: "photo.badge.plus")
                            .imageScale(.large)
                            .foregroundStyle(.black)
                    }

                    VStack(alignment: .leading) {
                        Text("名前")
                        TextField("名前を入力してください", text: $name)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.gray, lineWidth: 1)
                            )
                    }

                    VStack(alignment: .leading) {
                        DatePicker("誕生日", selection: $birthday, displayedComponents: .date)
                    }

                    VStack(alignment: .leading) {
                        Text("性別")
                        Picker("", selection: $sex) {
                            Text("Male").tag(1)
                            Text("Female").tag(2)
                        }
                        .pickerStyle(.segmented)
                    }

                    VStack(alignment: .leading) {
                        Text("郵便番号")
                        TextField("1234567", text: $zip)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.gray, lineWidth: 1)
                            )
                            .onChange(of: zip) { _, _ in
                                getAddress()
                            }
                    }

                    VStack(alignment: .leading) {
                        Text("都道府県")
                        TextField("東京都", text: $prefecture)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.gray, lineWidth: 1)
                            )
                    }

                    VStack(alignment: .leading) {
                        Text("市区町村")
                        TextField("新宿区", text: $city)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.gray, lineWidth: 1)
                            )
                    }

                    VStack(alignment: .leading) {
                        Text("住所")
                        TextField("1丁目2-3", text: $address)
                            .focused($isAddressFocused)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.gray, lineWidth: 1)
                            )
                    }

                    VStack(alignment: .leading) {
                        Text("メールアドレス")
                        TextField("例: sample@gmail.com", text: $email)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.gray, lineWidth: 1)
                            )
                    }

                    VStack(alignment: .leading) {
                        Text("パスワード")
                        HStack(alignment: .center) {
                            Image(systemName: "key.fill")
                                .padding(.leading, 5)

                            SecureField("パスワード", text: $password)
                                .padding(.leading, 5)
                        }
                        .padding(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.gray, lineWidth: 1)
                        )
                    }

                    VStack(alignment: .leading) {
                        Text("パスワード確認用")
                        HStack(alignment: .center) {
                            Image(systemName: "key.fill")
                                .padding(.leading, 5)

                            SecureField("パスワード確認用", text: $password2)
                                .padding(.leading, 5)
                        }
                        .padding(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.gray, lineWidth: 1)
                        )
                    }

                    Button("アカウント作成") {
                        checkPassword()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.horizontal)
                .padding([.top, .bottom], 30)

                .navigationTitle("アカウント作成")
            }
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
    AccountRegisterView()
}
