//
//  ImagePickerController.swift
//  UIViewRepresentableTest
//
//  Created by ์์ ์ง on 2022/08/14.
//
import SwiftUI
import UIKit
import Foundation

struct ImagePickerController: UIViewControllerRepresentable {
  
  // <img draggable="false" role="img" class="emoji" alt="๐" src="https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/svg/1f440.svg"> SwiftUI ์์์ ๋ถ๋ชจ๋ทฐ์ @State property๋ถํฐ์ Binding
  @Binding var selectedImage: Image?
  @Binding var existSelectedImage: Bool
  
  func makeUIViewController(context: Context) -> UIImagePickerController {
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = context.coordinator
    
    return imagePickerController
  }
  
  func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
  
  // <img draggable="false" role="img" class="emoji" alt="๐ซ" src="https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/svg/1f4ab.svg"> 2. Cordinator ๋์.
  func makeCoordinator() -> Coordinator {
    Coordinator(selectedImage: $selectedImage, existSelectedImage: $existSelectedImage)
  }
  
}

extension ImagePickerController {
  
  // <img draggable="false" role="img" class="emoji" alt="๐ซ" src="https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/svg/1f4ab.svg"> 1. Cordinator ๋ง๋ค๊ธฐ
  final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    // <img draggable="false" role="img" class="emoji" alt="๐" src="https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/svg/1f440.svg"> SwiftUI ์์์ ๋ถ๋ชจ๋ทฐ์ @State property๋ถํฐ์ Binding
    @Binding var selectedImage: Image?
    @Binding var existSelectedImage: Bool
    
    init(selectedImage: Binding<Image?>, existSelectedImage: Binding<Bool>) {
      _selectedImage = selectedImage
      _existSelectedImage = existSelectedImage
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      guard let selectedOriginalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
      
      selectedImage = Image(uiImage: selectedOriginalImage)
      existSelectedImage = true
    }
  }
  
}
