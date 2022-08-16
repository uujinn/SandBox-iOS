//
//  CustomTabView.swift
//  TossClone
//
//  Created by 양유진 on 2022/08/17.
//

import SwiftUI

struct CustomTabView: View {
  
  @Binding var selection: Tab
  
  var body: some View {
    HStack(alignment: .center, spacing: 45){
      ForEach(0..<5){ i in
        Button {
          switch i{
          case 0:
            selection = .one
          case 1:
            selection = .two
          case 2:
            selection = .three
          case 3:
            selection = .four
          case 4:
            selection = .five
          default:
            selection = .one
          }
        } label: {
          switch i{
          case 0:
            VStack{
              Spacer()
                .frame(height: 10)
              Image(systemName: "house")
              Text("홈")
            }
          case 1:
            VStack{
              Spacer()
                .frame(height: 10)
              Image(systemName: "diamond")
              Text("혜택")
            }
          case 2:
            VStack{
              Spacer()
                .frame(height: 10)
              Image(systemName: "dollarsign.circle")
              Text("송금")
            }
          case 3:
            VStack{
              Spacer()
                .frame(height: 10)
              Image(systemName: "scribble")
              Text("주식")
            }
          case 4:
            VStack{
              Spacer()
                .frame(height: 15)
              Image(systemName: "line.horizontal.3")
              Spacer()
                .frame(height: 5)
              Text("전체")
            }
          default:
            VStack{
              Image(systemName: "house")
              Text("홈")
            }
          }
        }
      }
    }//HStack
    .frame(width: Screen.maxWidth, height: 80, alignment: .top)
    .background(Color.white)
    .border(.secondary)
  }
}

struct CustomTabView_Previews: PreviewProvider {
  static var previews: some View {
    CustomTabView(selection: .constant(.one))
  }
}
