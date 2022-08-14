//
//  MainView.swift
//  baeminClone
//
//  Created by 양유진 on 2022/08/14.
//

import SwiftUI
import Refresher

struct MainView: View {
  @State private var searchText = ""
  @State var refreshed = 0
  
  let columns = [
    //추가 하면 할수록 화면에 보여지는 개수가 변함
    GridItem(.flexible(), spacing: 10),
    GridItem(.flexible(), spacing: 10)
  ]
  
  let columns2 = [
    //추가 하면 할수록 화면에 보여지는 개수가 변함
    GridItem(.flexible(), spacing: 10)
  ]
  
  let columns3 = [
    //추가 하면 할수록 화면에 보여지는 개수가 변함
    GridItem(.flexible(), spacing: 10),
    GridItem(.flexible(), spacing: 10),
    GridItem(.flexible(), spacing: 10)
  ]
  
  var body: some View {
    ZStack{
      NavigationView{
        VStack(spacing: 0){
          VStack{
            Spacer()
              .frame(height: 45)
            HStack{ // CustomNavigationView
              Spacer()
                .frame(width: 20)
              Button {
                print("우리집")
              } label: {
                Text("우리집")
                  .foregroundColor(.white)
                  .font(.system(size: 20))
                  .bold()
              }
              Spacer()
              Image(systemName: "pencil.tip")
                .resizable()
                .frame(width: 20, height: 20, alignment: .center)
                .padding(.all, 5)
                .foregroundColor(.white)
              Image(systemName: "pencil.tip")
                .resizable()
                .frame(width: 20, height: 20, alignment: .center)
                .padding(.all, 5)
                .foregroundColor(.white)
              Image(systemName: "pencil.tip")
                .resizable()
                .frame(width: 20, height: 20, alignment: .center)
                .padding(.all, 5)
                .foregroundColor(.white)
              Spacer()
                .frame(width: 20)
            }// HStack (CustomNavigationView)
            .frame(height: 50)
            .background(Color(hex: "2EBFBC"))
            //            .background(Color.yellow)
          }
          .background(Color(hex: "2EBFBC"))
          ZStack(alignment: .center){
            ScrollView{
              VStack(spacing: 0){
                Rectangle()
                  .frame(height: 75)
                  .foregroundColor(Color(hex: "#2EBFBC"))
                  .cornerRadius(25, corners: [.bottomLeft, .bottomRight])
                  .overlay {
                    Rectangle()
                      .foregroundColor(.white)
                      .frame(width: 350, height: 45, alignment: .center)
                    Text("검색창")
                      .foregroundColor(.gray)
                      .frame(width: 300, alignment: .leading)
                  }
                Spacer()
                  .frame(height: 20)
                HStack{
                  LazyVGrid(columns: columns, spacing: 0){
                    VStack{
                      Capsule()
                        .fill(Color.yellow)
                        .frame(height: 50)
                      Text("배민1")
                        .foregroundColor(.black)
                    }
                    .frame(height: (Screen.maxWidth - 50)/2)
                    .background(.white)
                    VStack{
                      Capsule()
                        .fill(Color.yellow)
                        .frame(height: 50)
                      Text("배달")
                        .foregroundColor(.black)
                    }
                    .frame(height: (Screen.maxWidth - 50)/2)
                    .background(.white)
                  }
                }
                .padding(.horizontal, 20)
                HStack{
                  LazyVGrid(columns: columns2, spacing: 20){
                    VStack{
                      Capsule()
                        .fill(Color.yellow)
                        .frame(height: 50)
                      Text("포장")
                        .foregroundColor(.black)
                    }
                    .background(.white)
                  }
                }
                .padding(20)
                HStack{
                  LazyVGrid(columns: columns, spacing: 0){
                    VStack{
                      Capsule()
                        .fill(Color.yellow)
                        .frame(height: 50)
                      Text("B마트")
                        .foregroundColor(.black)
                    }
                    .frame(height: (Screen.maxWidth - 40)/3)
                    .background(.white)
                    VStack{
                      Capsule()
                        .fill(Color.yellow)
                        .frame(height: 50)
                      Text("밀키트/간편식")
                        .foregroundColor(.black)
                    }
                    .frame(height: (Screen.maxWidth - 40)/3)
                    .background(.white)
                  }
                }
                .padding(.horizontal, 20)
                HStack{
                  LazyVGrid(columns: columns2, spacing: 20){
                    VStack{
                      Capsule()
                        .fill(Color.yellow)
                        .frame(height: 50)
                      Text("배민스토어")
                        .foregroundColor(.black)
                    }
                    .background(.white)
                  }
                }
                .padding(20)
                HStack{
                  LazyVGrid(columns: columns3, spacing: 0){
                    VStack{
                      Capsule()
                        .fill(Color.yellow)
                        .frame(height: 50)
                      Text("쇼핑라이브")
                        .foregroundColor(.black)
                    }
                    .background(.white)
                    VStack{
                      Capsule()
                        .fill(Color.yellow)
                        .frame(height: 50)
                      Text("선물하기")
                        .foregroundColor(.black)
                    }
                    .background(.white)
                    VStack{
                      Capsule()
                        .fill(Color.yellow)
                        .frame(height: 50)
                      Text("전국별미")
                        .foregroundColor(.black)
                    }
                    .background(.white)
                  }
                }.padding(.horizontal, 20)
                HStack{
                  LazyVGrid(columns: columns, spacing: 0){
                    VStack{
                      Capsule()
                        .fill(Color.yellow)
                        .frame(height: 50)
                      Text("쇼핑라이브")
                        .foregroundColor(.black)
                    }
                    .background(.white)
                    VStack{
                      Capsule()
                        .fill(Color.yellow)
                        .frame(height: 50)
                      Text("선물하기")
                        .foregroundColor(.black)
                    }
                    .background(.white)                  }
                }.padding(20)
              }// SearchBar
              .background(Color(hex: "#F6F6F6"))
            }//ScrollView
            .refresher(refreshView: EmojiRefreshView.init) { done in // Called when pulled to refresh
              DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                refreshed += 1
                done() // Stops the refresh view (can be called on a background thread)
              }
            }
            .background(Color(hex: "2EBFBC"))
          }//ZStack
          
          
        }//VStack
        .navigationBarHidden(true)
        .ignoresSafeArea()
      }//NavigationView
    }//ZStack
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}

public struct EmojiRefreshView: View {
  @Binding var state: RefresherState
  @State private var angle: Double = 0.0
  @State private var isAnimating = false
  
  var foreverAnimation: Animation {
    Animation.linear(duration: 1.0)
      .repeatForever(autoreverses: false)
  }
  
  public var body: some View {
    VStack {
      switch state.mode {
      case .notRefreshing:
        VStack{
          Text("🤪")
            .onAppear {
              isAnimating = false
            }
        }
        .frame(width: Screen.maxWidth)
        .background(Color(hex: "2EBFBC"))
        
      case .pulling:
        VStack{
          Text("😯")
            .rotationEffect(.degrees(360 * state.dragPosition))
        }
        .frame(width: Screen.maxWidth)
        .background(Color(hex: "2EBFBC"))
      case .refreshing:
        VStack{
          Text("😂")
            .rotationEffect(.degrees(self.isAnimating ? 360.0 : 0.0))
            .onAppear {
              withAnimation(foreverAnimation) {
                isAnimating = true
              }
            }
        }
        .frame(width: Screen.maxWidth)
        .background(Color(hex: "2EBFBC"))
      }
    }
    .scaleEffect(2)
  }
}
