//
//  PageView.swift
//  UIPageViewControllerRepresentableTest
//
//  Created by 양유진 on 2022/08/14.
//

import SwiftUI

struct PageView<Page: View>: View {
  
  var viewControllers: [UIHostingController<Page>]
  
  init(_ views: [Page]){
    self.viewControllers = views.map { UIHostingController(rootView: $0) }
  }
  var body: some View {
    PageViewController(controllers: viewControllers)
  }
}

//struct PageView_Previews: PreviewProvider {
//  static var previews: some View {
//    PageView(features.map { FeatureCard(landmark: $0) })
//      .aspectRatio(3/2, contentMode: .fit)
//  }
//}
