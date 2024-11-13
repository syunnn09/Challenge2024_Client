//
//  ContentView.swift
//  BuddhaStatueConversion
//
//  Created by shusuke imamura on 2024/08/15.
//

import SwiftUI

struct ContentView: View {
    @State var showingCamera = false
    @EnvironmentObject var manager: ToolbarManager

    var body: some View {
        NavigationView {
            LoginView()

            .toolbar {
                if !ToolbarManager.shared.isHidden {
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationLink {
                            CameraView(image: .constant(UIImage()))
                        } label: {
                            Button {
                                
                            } label: {
                                Image(systemName: "person")
                            }
                        }
                    }

                    ToolbarItem(placement: .principal) {
                        Text("Buddha Statue")
                    }
                }
            }
        }
        .sheet(isPresented: $showingCamera) {
            NavigationView {
                HomeView()
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    ContentView()
}
