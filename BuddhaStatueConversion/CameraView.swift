//
//  LoadCameraView.swift
//  BuddhaStatueConversion
//
//  Created by shusuke imamura on 2024/08/15.
//

import SwiftUI

struct CameraView: View {
    @Binding var image : UIImage?
    @State var showingCamera: Bool = false

    var body: some View {
        VStack {
            if (image != nil) {
                Image(uiImage: self.image!)
                    .resizable()
                    .frame(width: 300, height: 150)
            }

            Button(action: {
                showingCamera = true
            }, label: {
                Text("カメラを起動")
            })
            .sheet(isPresented: $showingCamera, content: {
                Camera(image: $image, showingCamera: $showingCamera)
            })
        }
    }
}

#Preview {
    CameraView(image: .constant(UIImage()))
}
