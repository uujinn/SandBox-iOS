//
//  ContentView.swift
//  PathSwiftUI
//
//  Created by 양유진 on 2022/08/18.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    //    MySquare()
    //      .frame(width: 250, height: 250)
    Raindrop()
      .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .topLeading, endPoint: .bottom))
      .frame(width: 200, height: 200, alignment: .center)
      
              
  }
}

struct MySquare: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    
    path.move(to: CGPoint(x: rect.size.width, y: 0))
    path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.width))
    path.addLine(to: CGPoint(x: 0, y: rect.size.width))
    path.addLine(to: CGPoint(x: 0, y: 0))
    path.closeSubpath()
    
    return path
  }
}

struct Raindrop: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.size.width/2, y: 0))
      path.addQuadCurve(to: CGPoint(x: rect.size.width/2, y: rect.size.height), control: CGPoint(x: rect.size.width, y: rect.size.height))
      
      path.addQuadCurve(to: CGPoint(x: rect.size.width/2, y: 0), control: CGPoint(x: 0, y: rect.size.height))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
