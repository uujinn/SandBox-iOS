//
//  ActivityIndicator.swift
//  UIViewRepresentableTest
//
//  Created by 양유진 on 2022/08/14.
//

import Foundation
import UIKit
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
  @Binding var isAnimating: Bool
  
  func makeUIView(context: Context) -> UIActivityIndicatorView {
    let view = UIActivityIndicatorView()
    view.style = .large
    
    return view
  }
  
  func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
    if isAnimating {
      uiView.startAnimating()
    }
    else {
      uiView.stopAnimating()
    }
  }
}
