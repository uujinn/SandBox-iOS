//
//  PageViewController.swift
//  UIPageViewControllerRepresentableTest
//
//  Created by 양유진 on 2022/08/14.
//

import Foundation
import UIKit
import SwiftUI

struct PageViewController: UIViewControllerRepresentable{
  var controllers: [UIViewController]

  func makeUIViewController(context: Context) -> UIPageViewController {
    let pageViewController = UIPageViewController(
      transitionStyle: .scroll,
      navigationOrientation: .horizontal)
    
    
    return pageViewController
  }
  
  func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
    pageViewController.setViewControllers([controllers[0]], direction: .forward, animated: true)
  }
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(self)
  }
  
  class Coordinator: NSObject, UIPageViewControllerDataSource{
    
    var parent: PageViewController
    
    init(_ pageViewController: PageViewController) {
      self.parent = pageViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
      guard let index = parent.controllers.firstIndex(of: viewController) else {
        return nil
      }
      
      if index == 0{
        return parent.controllers.last
      }
      return parent.controllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
      guard let index = parent.controllers.firstIndex(of: viewController) else {
        return nil
      }
      if index + 1 == parent.controllers.count{
        return parent.controllers.first
      }
      
      return parent.controllers[index + 1]
    }
  }
}


