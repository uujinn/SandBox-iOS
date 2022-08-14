//
//  ContentView.swift
//  StarsCreamTest
//
//  Created by 양유진 on 2022/07/24.
//

import SwiftUI

struct ContentView: View {
  
  @StateObject var vm = ChatScreenViewModel()
  
  @State var text = ""
  @State var receivedText = ""
  var function: (() -> Void)?
  
  var body: some View {
    VStack{
      Text("\(vm.messages)")
      
      TextField("Enter", text: $text)
        .padding()
        .background(Color.gray)
        .opacity(0.4)
      
      
      Button {
        print("Send")
//        self.vm.send(message: text)
      } label: {
        Text("Send")
          .padding()
          .background(Color.pink)
      }

    }
    .onAppear{
      self.vm.connect()
    }
    
  }

  func receivedMessage(newText: String){
    self.receivedText = newText
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
