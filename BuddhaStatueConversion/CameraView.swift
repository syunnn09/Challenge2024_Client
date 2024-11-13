//
//  LoadCameraView.swift
//  BuddhaStatueConversion
//
//  Created by shusuke imamura on 2024/08/15.
//

import SwiftUI

struct CameraView: View {
    @Binding var image: UIImage?
    @State var showingCamera: Bool = false

    var body: some View {
        VStack {
            if (image != nil) {
                Image(uiImage: self.image!)
                    .resizable()
                    .frame(width: self.image!.size.width / 10, height: self.image!.size.height / 10)
            }

            Button(action: {
                showingCamera = true
            }, label: {
                Text("カメラを起動")
            })
            .sheet(isPresented: $showingCamera, content: {
                Camera(image: $image, showingCamera: $showingCamera)
            })
            .onChange(of: self.image) {
                print(self.image!.size.width, self.image!.size.height)
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
    CameraView(image: .constant(UIImage()))
}
