//
//  ContentView.swift
//  ScrollViewRefresh
//
//  Created by 양유진 on 2022/08/15.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ScrollView{
      VStack{
        Text("hi")
        Text("hello")
      }
      .frame(width: 300)
    }
    .background(Color.yellow)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
