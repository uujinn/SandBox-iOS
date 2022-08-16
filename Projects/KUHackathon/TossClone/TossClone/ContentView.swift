//
//  ContentView.swift
//  TossClone
//
//  Created by 양유진 on 2022/08/17.
//

import SwiftUI

class TabBarManager: ObservableObject {
  @Published var showTabBar: Bool = true

  static let shared = TabBarManager()
}

enum Tab{
  case one
  case two
  case three
  case four
  case five
}

struct ContentView: View {
  
  @State private var selection: Tab = .one
  @ObservedObject var tabbarManager = TabBarManager.shared
  
  var body: some View {
    VStack(spacing: 0){
      ZStack{
        switch selection {
        case .one:
          VStack{
            Text("one")
          }
        case .two:
          VStack{
            Text("two")
          }
        case .three:
          VStack{
            Text("three")
          }
        case .four:
          VStack{
            Text("four")
          }
        case .five:
          VStack{
            Text("five")
          }
        }
      }//ZStack
      Spacer()
      if (tabbarManager.showTabBar){
        CustomTabView(selection: $selection)
      }
      
    }
    .ignoresSafeArea(.container, edges: [.bottom])
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
