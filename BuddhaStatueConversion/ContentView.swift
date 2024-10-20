//
//  ContentView.swift
//  BuddhaStatueConversion
//
//  Created by shusuke imamura on 2024/08/15.
//

import SwiftUI

struct ContentView: View {

    @State var showingCamera = false

    var body: some View {
        NavigationView {
            LoginView()

            .toolbar {
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

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingCamera = true
                    } label: {
                        Image(systemName: "gear")
                    }
                }
            }
        }
        .sheet(isPresented: $showingCamera) {
            HomeView()
        }
    }
}

#Preview {
    ContentView()
}
