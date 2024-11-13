//
//  Camera2.swift
//  BuddhaStatueConversion
//
//  Created by shusuke imamura on 2024/11/04.
//

import SwiftUI
import Alamofire

struct CameraView2: View {
    @Binding var image: UIImage?
    @State private var showingCamera = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack(alignment: .topTrailing) {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.width - 40)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )

                    Button {
                        showingCamera = true
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 24))
                            .foregroundStyle(.white)
                            .background(Circle().fill(.black))
                    }
                    .padding(8)
                } else {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.width - 40)
                }
            }

            PrimaryButton(title: "次へ") {
                sendImage(image: image!)
            }
            .padding(.horizontal, 20)
            
            Text("顔像の位置をクリアに撮るコツ!!")
                .font(.system(size: 14))
            
            VStack(alignment: .leading, spacing: 8) {
                Text("1. 明るい場所で、正面で手振れ無く")
                Text("2. 髪の毛は耳を出して、すっきりと")
                Text("3. スガマヤマスクはオフで、素顔で撮影！")
            }
            .font(.system(size: 12))
            .padding(.bottom, 20)

            PrimaryButton(title: "ホームに戻る") {
                dismiss()
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .padding(.top, 20)
        .navigationBarBackButtonHidden()
    }
}

func sendImage(image: UIImage){
    let url = "http://127.0.0.1:5000/transform"
    print(url)
    let headers: HTTPHeaders = [
        "Content-type": "multipart/form-data"
    ]
    guard let imageData = image.jpegData(compressionQuality: 1.0) else { return }
    AF.upload(multipartFormData: { (multipartFormData) in
        multipartFormData.append(imageData, withName: "image", fileName: "image.jpg", mimeType: "image/jpeg")
    }, to: url, method: .post, headers: headers).responseString {
        (response) in
        if let statusCode = response.response?.statusCode {
            print(statusCode)
            if case 200...299 = statusCode{
                print("正常")
            } else {
                print("通信エラー")
            }
        }
    }
}

#Preview {
    CameraView2(image: .constant(nil))
}
