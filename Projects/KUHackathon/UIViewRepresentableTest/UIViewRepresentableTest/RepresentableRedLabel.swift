//
//  RepresentableRedLabel.swift
//  UIViewRepresentableTest
//
//  Created by 양유진 on 2022/08/14.
//
import SwiftUI
import UIKit
import Foundation

struct RepresentableRedLabel: UIViewRepresentable {
  var text: String
  
  let redLabel = UILabel()
  
  func makeUIView(context: Context) -> UILabel {
    redLabel
  }
  
  func updateUIView(_ uiView: UILabel, context: Context) {
    redLabel.text = text
    redLabel.textColor = .red
  }
}
