//
//  oneView.swift
//  TossClone
//
//  Created by 양유진 on 2022/08/18.
//

import SwiftUI

struct oneView: View {
  @State var gotoTossBank = false
  @State var gotoJaSan = false
  var body: some View {
    ZStack{
      NavigationView{
        ZStack{
          Color.secondary.opacity(0.15).edgesIgnoringSafeArea(.all)
          VStack{
            HStack{
              Image(systemName: "dollarsign.square")
                .resizable()
                .frame(width: 25, height: 25)
                .padding(.leading, 15)
              Text("toss")
                .font(.system(size: 25))
                .bold()
              Spacer()
              Image(systemName: "bubble.left.fill")
                .resizable()
                .frame(width: 25, height: 25)
              Image(systemName: "bell.fill")
                .resizable()
                .frame(width: 25, height: 25)
                .padding(.horizontal, 15)
            }.foregroundColor(.black).opacity(0.6)
            ScrollView{
              VStack{
                VStack(spacing: 0){
                  HStack{
                    Text("토스뱅크")
                      .font(.system(size: 25))
                      .bold()
                    Spacer()
                    Text(">")
                  }.padding()
                  HStack{
                    Image(systemName: "clock")
                      .resizable()
                      .frame(width: 40, height: 40)
                    VStack(alignment: .leading){
                      Text("선착순 가입축하금 이벤트")
                      Text("딱 3만명에게만 1만원을 드려요")
                    }
                    Spacer()
                  }.padding()
                }//VStack - 토스뱅크
                .background(Color.white)
                .padding(.horizontal, 15)
                .onTapGesture {
                  gotoTossBank = true
                  print(gotoTossBank)
                }
                VStack(spacing: 0){
                  HStack{
                    Text("자산")
                      .font(.system(size: 25))
                      .bold()
                    Spacer()
                    Text(">")
                  }.padding()
                  ForEach(0..<6, id: \.self){ num in
                    HStack{
                      Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                      VStack(alignment: .leading){
                        Text("저축 예금")
                          .font(.system(size: 14))
                        Text("363,467원")
                      }
                      Spacer()
                      Text("송금")
                        .padding(8)
                        .background(Color.gray.opacity(0.15))
                    }.padding()
                  }
                }//VStack - 자산
                .onTapGesture {
                  gotoJaSan = true
                }
                .background(Color.white)
                .padding(.horizontal, 15)
                ScrollView(.horizontal){
                  HStack{
                    ForEach(0..<3, id: \.self){ num in
                      VStack{
                        Text("54개 금융사")
                        Text("대출 한도 조회")
                        HStack{
                          Spacer()
                          Image(systemName: "dollarsign.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                        }
                      }
                      .padding()
                      .background(Color.white)
                      .padding(15)
                    }//ForEach
                  }//HStack
                }//Horizontal ScrollView
              }//VStack
            }//ScrollView
          }//VStack
          NavigationLink(isActive: $gotoTossBank) {
            TossBank()
          } label: {
            Text("")
          }
          NavigationLink(isActive: $gotoJaSan) {
            TwoView()
          } label: {
            Text("")
          }
          
        }//ZStack
        .navigationBarHidden(true)
      }//NavigationView
    }//ZStack
    
  }
}

struct oneView_Previews: PreviewProvider {
  static var previews: some View {
    oneView()
  }
}
