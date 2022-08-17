//
//  ContentView.swift
//  DefaultAnimation
//
//  Created by 양유진 on 2022/08/18.
//

import SwiftUI

struct ContentView: View {
  @State private var animationAmount = 1.0
  
  var body: some View {
//    Button("Tap Me") {
//      animationAmount += 1
//    }
//    .padding(50)
//    .background(.red)
//    .foregroundColor(.white)
//    .clipShape(Circle())
//    .scaleEffect(animationAmount)
//    .animation(.easeInOut(duration: 2), value: animationAmount)
    PillLoader()
      
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
