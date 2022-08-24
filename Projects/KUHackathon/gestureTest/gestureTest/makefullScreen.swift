//
//  makefullScreen.swift
//  gestureTest
//
//  Created by 양유진 on 2022/08/21.
//

import SwiftUI

struct TestRisingView: View {
  
  let screen = UIScreen.main.bounds
  
  @State var showingView = false
  @State var btFrame: CGRect = .zero
  
  var body: some View {
    GeometryReader { g in
      ZStack {
        Rectangle().fill(Color.clear)
        
        self.activatingButton(frame: CGRect(x: 80, y: 30, width: 60, height: 40))
        self.activatingButton(frame: CGRect(x: self.screen.maxX - 80, y: 30, width: 60, height: 40))
        self.activatingButton(frame: CGRect(x: self.screen.maxX - 80, y: self.screen.maxY - 60, width: 60, height: 40))
        self.activatingButton(frame: CGRect(x: 80, y: self.screen.maxY - 60, width: 60, height: 40))
        
        if self.showingView {
          self.topView
            .zIndex(1)
            .transition(
              AnyTransition.scale(scale: 0.12).combined(with:
                                                          AnyTransition.offset(x: self.btFrame.origin.x - g.size.width/2.0,
                                                                               y: self.btFrame.origin.y - g.size.height/2.0))
            )
        }
      }
    }
  }
  
  func activatingButton(frame: CGRect) -> some View {
    Button(action: {
      withAnimation {
        self.btFrame = frame
        self.showingView.toggle()
      }
    }) {
      Text("Tap")
        .padding()
        .background(Color.yellow)
    }
    .position(frame.origin)
  }
  
  var topView: some View {
    Rectangle()
      .fill(Color.green)
      .frame(width: 300, height: 400)
  }
}

struct makefullScreen_Previews: PreviewProvider {
  static var previews: some View {
    TestRisingView()
  }
}
