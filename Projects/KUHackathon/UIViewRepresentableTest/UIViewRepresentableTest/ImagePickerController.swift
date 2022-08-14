//
//  ImagePickerController.swift
//  UIViewRepresentableTest
//
//  Created by 양유진 on 2022/08/14.
//
import SwiftUI
import UIKit
import Foundation

struct ImagePickerController: UIViewControllerRepresentable {
  
  // <img draggable="false" role="img" class="emoji" alt="👀" src="https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/svg/1f440.svg"> SwiftUI 에서의 부모뷰의 @State property부터의 Binding
  @Binding var selectedImage: Image?
  @Binding var existSelectedImage: Bool
  
  func makeUIViewController(context: Context) -> UIImagePickerController {
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = context.coordinator
    
    return imagePickerController
  }
  
  func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
  
  // <img draggable="false" role="img" class="emoji" alt="💫" src="https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/svg/1f4ab.svg"> 2. Cordinator 대입.
  func makeCoordinator() -> Coordinator {
    Coordinator(selectedImage: $selectedImage, existSelectedImage: $existSelectedImage)
  }
  
}

extension ImagePickerController {
  
  // <img draggable="false" role="img" class="emoji" alt="💫" src="https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/svg/1f4ab.svg"> 1. Cordinator 만들기
  final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    // <img draggable="false" role="img" class="emoji" alt="👀" src="https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/svg/1f440.svg"> SwiftUI 에서의 부모뷰의 @State property부터의 Binding
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
