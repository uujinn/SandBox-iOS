//
//  TextView.swift
//  UITextViewRepresentableTest
//
//  Created by 양유진 on 2022/08/14.
//

import Foundation
import UIKit
import SwiftUI

struct TextView: UIViewRepresentable {

  
  @Binding var text: String
  @Binding var number: Int
//  @Binding var font: UIFont
  
  func makeUIView(context: Context) -> UITextView {
    let textView = UITextView()
//    textView.font = font
    textView.delegate = context.coordinator
    
    return textView
  }
  
  func updateUIView(_ uiView: UITextView, context: Context) {
    uiView.text = text
//    uiView.font = font
  }
  
  func makeCoordinator() -> Coordinator {
    return Coordinator($text)
  }
  
  class Coordinator: NSObject { // UIKit -> SwiftUI로의 데이터 전달
    var hello: Binding<String>
    
    init(_ hello: Binding<String>) {
      self.hello = hello
    }
  }
}

extension TextView.Coordinator: UITextViewDelegate {
  func textViewDidChange(_ textView: UITextView) {
    DispatchQueue.main.async {
      self.hello.wrappedValue = textView.text + "123"
    }
    print(hello.wrappedValue)
  }
}
