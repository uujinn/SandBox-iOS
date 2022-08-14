//
//  ContentView.swift
//  UITextViewRepresentableTest
//
//  Created by 양유진 on 2022/08/14.
//

import SwiftUI

struct ContentView: View {
  @State private var text = "12"
  @State private var number = 0
  @State private var texttext = ""
  var body: some View {
    TextView(text: $text, number: $number)
      .onChange(of: text) { newValue in
        texttext = text
      }
    Text("\(texttext)")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
