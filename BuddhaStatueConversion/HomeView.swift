//
//  HomeView.swift
//  BuddhaStatueConversion
//
//  Created by shusuke imamura on 2024/08/15.
//

import SwiftUI
import PhotosUI

struct HomeView: View {
    @State var searchText = ""
    @State var pickerItem: PhotosPickerItem?
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("検索")
                    .bold()
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("日付・撮影地", text: $searchText)
                }
                .padding()
                .background(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .padding(.bottom, 30)

                Text("これまでの写真を見る")
                    .bold()
                LazyVGrid(columns: columns, content: {
                    ForEach(1...6, id: \.self) { _ in
                        RecentImageView()
                            .frame(width: 20, height: 10)
                    }
                })
                .frame(width: .infinity, height: 20)
                .padding()
                .background(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.bottom, 30)

                Text("写真をアップロード")
                    .bold()
                ZStack(alignment: .center) {
                    PhotosPicker(selection: $pickerItem) {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: .infinity, height: 100)
                            .foregroundStyle(.gray)
                    }
                    .background(.gray)
                    Text("upload")
                        .foregroundStyle(.white)
                }
            }
            .padding()
            
            Spacer()

            Button {
                
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 70, height: 70, alignment: .center)
                    
                    Circle()
                        .foregroundStyle(.white)
                        .frame(width: 60, height: 60, alignment: .center)
                }
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    HomeView()
}
