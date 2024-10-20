//
//  CameraView.swift
//  BuddhaStatueConversion
//
//  Created by shusuke imamura on 2024/08/15.
//

import SwiftUI

struct Camera: UIViewControllerRepresentable {

    @Binding var image: UIImage?
    @Binding var showingCamera: Bool

    func makeUIViewController(context: UIViewControllerRepresentableContext<Camera>) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = .camera
        controller.delegate = context.coordinator
        return controller
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<Camera>) {
        
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        let parent: Camera

        init(parent: Camera) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[.originalImage] as! UIImage
            self.parent.image = image
            self.parent.showingCamera = false
        }
    }
}
