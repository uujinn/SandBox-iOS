//
//  Profile.swift
//  UIPageViewControllerRepresentableTest
//
//  Created by ์์ ์ง on 2022/08/14.
//

/*
 See LICENSE folder for this sampleโs licensing information.
 
 Abstract:
 A representation of user profile data.
 */

import Foundation

struct Profile {
  var username: String
  var prefersNotifications = true
  var seasonalPhoto = Season.winter
  var goalDate = Date()
  
  static let `default` = Profile(username: "g_kumar")
  
  enum Season: String, CaseIterable, Identifiable {
    case spring = "๐ท"
    case summer = "๐"
    case autumn = "๐"
    case winter = "โ๏ธ"
    
    var id: String { rawValue }
  }
}
