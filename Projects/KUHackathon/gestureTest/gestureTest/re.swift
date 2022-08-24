//
//  re.swift
//  gestureTest
//
//  Created by 양유진 on 2022/08/21.
//

import SwiftUI
import UIKit

struct re: View {
  @State var XOffset = 0.0
  @State var yOffset = 0.0
  var body: some View {
    HStack{
      Rectangle()
        .frame(width: 200, height: 200)
        .offset(x: XOffset, y: yOffset)
        .modifier(TapAndLongPressModifier(tapAction: { print("tap") }, longPressAction: { print("long") }))
      Rectangle()
        .frame(width: 200, height: 200)
        .offset(x: XOffset, y: yOffset)
        .modifier(TapAndLongPressModifier(tapAction: { print("tap")
          XOffset = 0
          yOffset = 0
          
        }, longPressAction: { print("long")
          XOffset = -200
          yOffset = 0
          
        }))
    }
  }
}

struct re_Previews: PreviewProvider {
  static var previews: some View {
    re()
  }
}

struct TapAndLongPressModifier: ViewModifier {
  @State private var isLongPressing = false
  @State private var xoffset: CGFloat = 0
  @State private var yoffset: CGFloat = 0
  let tapAction: (()->())
  let longPressAction: (()->())
  func body(content: Content) -> some View {
    content
      .scaleEffect(isLongPressing ? 2.0 : 1.0)
      .onLongPressGesture(minimumDuration: 10.0, pressing: { (isPressing) in
        withAnimation {
          isLongPressing = isPressing
          print(isPressing)
          if isPressing == false{ // 길게 누르고 있을 때
            withAnimation {
              xoffset = -50
            }

          }else{ // 누르고 있지 않을 때
            withAnimation {
              xoffset = 0
            }
          }
        }
      }, perform: {
        longPressAction()
      })
      .simultaneousGesture(
        TapGesture()
          .onEnded { _ in
            tapAction()
          }
      )
  }
}
