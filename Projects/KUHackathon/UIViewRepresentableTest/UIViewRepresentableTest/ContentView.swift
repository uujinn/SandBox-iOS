//
//  ContentView.swift
//  UIViewRepresentableTest
//
//  Created by 양유진 on 2022/08/14.
//

import SwiftUI

struct ContentView: View {
  @State var presented: Bool = false
  
  var body: some View{
    VStack{
      TableView(presented: $presented)
        .onAppear {
          self.presented = true
        }
        .onTapGesture {
          self.presented = false
          print("pressed")
        }
    }
  }
  
  
//  @State var isAnimating: Bool = false
  
//  var body: some View {
//    VStack {
//      ActivityIndicator(isAnimating: $isAnimating)
//      Button(action: { self.isAnimating = !self.isAnimating },
//             label: { Text("show/hide")
//          .foregroundColor(Color.white)
//      })
//      .background(Color.black)
//    }
//  }
  
  //  @State private var selectedImage: Image?
  //  @State private var existSelectedImage = false
  //  var body: some View {
  //    ZStack {
  //      VStack {
  //        selectedImage?
  //          .resizable()
  //          .aspectRatio(contentMode: .fit)
  //          .frame(width: 100.0, height: 100.0)
  //        Button(action: didTapSelectedImageButton) {
  //          Text("Select Image")
  //        }
  //      }
  //
  //      if selectedImage == nil {
  //        ImagePickerController(
  //          selectedImage: $selectedImage,
  //          existSelectedImage: $existSelectedImage
  //        )
  //      }
  //    }
  //  }
  //
  //  private func didTapSelectedImageButton() {
  //    selectedImage = nil
  //    existSelectedImage = false
  //  }
  //  var body: some View {
  //    RepresentableRedLabel(text: "Hello~")
  //    ImagePickerController()
  
  //  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
