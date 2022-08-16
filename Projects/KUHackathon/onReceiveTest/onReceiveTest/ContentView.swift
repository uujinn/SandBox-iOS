//
//  ContentView.swift
//  onReceiveTest
//
//  Created by 양유진 on 2022/08/17.
//

import SwiftUI
import Combine

struct ContentView: View {
  @State var currentDate = Date()
  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  
  var body: some View {
    Text("\(currentDate)")
      .onReceive(timer) { input in
        self.currentDate = input
      }
  }
}

//struct ContentView: View {
//
//  let publisher: PassthroughSubject<Int, Never> = PassthroughSubject()
//
//  @State private var text: String = "초기값"
//
//  var body: some View {
//    Button(self.text) {
//      self.publisher.send(Array(1...10).randomElement()!)
//    }.onReceive(self.publisher, perform: { value in
//      self.text = "\(value)"
//    })
//  }
//}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
