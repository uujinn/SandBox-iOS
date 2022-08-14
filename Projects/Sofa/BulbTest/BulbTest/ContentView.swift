//
//  ContentView.swift
//  BulbTest
//
//  Created by 양유진 on 2022/07/10.
//

import SwiftUI

struct ContentView: View {

  @State var text: String
  var body: some View {
    ExpandingTextView(text: $text)
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(text: "")
  }
}
