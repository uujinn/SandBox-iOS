//
//  oneView.swift
//  baeminClone
//
//  Created by 양유진 on 2022/08/16.
//

import SwiftUI

struct oneView: View {
  @State var currentTab: Int = 0
  @Namespace var namespace
  
  var body: some View {
    ZStack(alignment: .top) {
      TabView(selection: self.$currentTab, content: {
        view1.tag(0)
        view2.tag(1)
        view3.tag(2)
      })
        .tabViewStyle(.page(indexDisplayMode: .never))
        .edgesIgnoringSafeArea([.bottom])
      navigationBarView
    }
    .navigationBarTitleDisplayMode(.inline)
  }
  
  var navigationitems: [String] = ["Hello World", "This is", "A Pretty Cool Tab Bar"]
  
  var navigationBarView: some View {
    ScrollView(.horizontal) {
      HStack(spacing: 20) {
        ForEach(Array(zip(self.navigationitems.indices, self.navigationitems)), id: \.0, content: {
          index, name in
          navBarItem(string: name, tab: index)
        })
      }
      .padding(.horizontal)
    }
    .background(Color.red)
    .frame(height: 30)
  }
  
  
  func navBarItem(string: String, tab: Int) -> some View {
    Button {
        self.currentTab = tab
    } label: {
      VStack {
        Spacer()
        Text(string)
          .font(.system(size: 13, weight: .light, design: .default))
        if self.currentTab == tab {
          Color.black.frame(height: 2)
            .matchedGeometryEffect(id: "underline", in: namespace, properties: .frame)
        } else {
          Color.clear.frame(height: 2)
        }
      }.animation(.spring(), value: currentTab)
    }
    .buttonStyle(.plain)
  }

  var view1: some View {
    Color.red.opacity(0.2).edgesIgnoringSafeArea(.all)
  }

  var view2: some View {
    Color.blue.opacity(0.2).edgesIgnoringSafeArea(.all)
  }
  
  var view3: some View {
    Color.yellow.opacity(0.2).edgesIgnoringSafeArea(.all)
  }
}

struct oneView_Previews: PreviewProvider {
  static var previews: some View {
    oneView()
  }
}
