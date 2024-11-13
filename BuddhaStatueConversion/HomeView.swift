//
//  HomeView.swift
//  BuddhaStatueConversion
//
//  Created by shusuke imamura on 2024/08/15.
//

import SwiftUI
import PhotosUI

let gray = Color(hex: "D9D9D9")

struct HomeView: View {
    @State var searchText = ""
    @State var pickerItem: PhotosPickerItem?
    @State var image: UIImage?
    @State var showingCamera = false
    @State var toNext = false
    
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 8), count: 3)
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("検索")
                        .fontWeight(.bold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("日付、撮影地", text: $searchText)
                    }
                    .padding(12)
                    .background(gray)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("これまでの写真を見る")
                        .fontWeight(.bold)

                    PhotosPicker(selection: $pickerItem) {
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .background(gray)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .buttonStyle(.plain)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("写真をアップロード")
                        .fontWeight(.bold)
                    
                    PhotosPicker(selection: $pickerItem) {
                        VStack(spacing: 12) {
                            VStack(spacing: -3) {
                                Image(systemName: "arrow.up")
                                Image(systemName: "space")
                            }
                            Text("ファイルまたはマイデバイスから画像を選択")
                                .font(.system(size: 14))
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 150)
                        .background(gray)
                        .overlay {
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                .padding(20)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .onChange(of: pickerItem) {
                        Task {
                            do {
                                if let data = try await pickerItem!.loadTransferable(type: Data.self) {
                                    if let uiImage = UIImage(data: data) {
                                        self.image = uiImage
                                        self.toNext = true
                                    }
                                }
                            }
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)
            .padding(.top, 8)
        }
        .overlay(alignment: .bottom) {
            Button {
                showingCamera = true
            } label: {
                ZStack {
                    Circle()
                        .fill(.black)
                        .frame(width: 72, height: 72)
                    
                    Circle()
                        .fill(gray)
                        .frame(width: 60, height: 60)
                }
            }
            .padding(.bottom, 24)
        }
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .top) {
            Color.clear.frame(height: 0)
        }
        .navigationBarBackButtonHidden()
        .sheet(isPresented: $showingCamera) {
            Camera(image: $image, showingCamera: $showingCamera)
        }
        .onChange(of: image) {
            if image != nil {
                toNext = true
            }
        }
        .navigationDestination(isPresented: $toNext) {
            CameraView2(image: $image)
        }
    }
}

#Preview {
    HomeView()
}
