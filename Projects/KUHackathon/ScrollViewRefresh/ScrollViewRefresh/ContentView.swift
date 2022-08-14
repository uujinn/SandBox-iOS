//
//  ContentView.swift
//  ScrollViewRefresh
//
//  Created by 양유진 on 2022/08/15.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ScrollView {
      PullToRefresh(coordinateSpaceName: "pullToRefresh") {
        // do your stuff when pulled
      }
      
      Text("Some view...")
    }.coordinateSpace(name: "pullToRefresh")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
