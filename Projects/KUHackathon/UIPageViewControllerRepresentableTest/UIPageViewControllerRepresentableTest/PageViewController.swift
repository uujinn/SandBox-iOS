//
//  PageViewController.swift
//  UIPageViewControllerRepresentableTest
//
//  Created by 양유진 on 2022/08/14.
//

import Foundation
import SwiftUI
import UIKit

// Page instances 저장
struct PageViewController<Page: View>: UIViewControllerRepresentable{
  var pages: [Page]
  
  // SwiftUI calls this method a single time when it’s ready to display the view, and then manages the view controller’s life cycle.
  func makeUIViewController(context: Context) -> UIPageViewController {
    let pageViewController = UIPageViewController(
      transitionStyle: .scroll,
      navigationOrientation: .horizontal)
    pageViewController.dataSource = context.coordinator
    return pageViewController
  }
  
  func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
    pageViewController.setViewControllers(
      [UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  class Coordinator: NSObject, UIPageViewControllerDataSource {
    var parent: PageViewController
    var controllers = [UIViewController]()
    
    init(_ pageViewController: PageViewController) {
      parent = pageViewController
      controllers = parent.pages.map { UIHostingController(rootView: $0) }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
      guard let index = controllers.firstIndex(of: viewController) else {
        return nil
      }
      if index == 0 {
        return controllers.last
      }
      return controllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
      guard let index = controllers.firstIndex(of: viewController) else {
        return nil
      }
      if index + 1 == controllers.count {
        return controllers.first
      }
      return controllers[index + 1]
    }
  }
}
