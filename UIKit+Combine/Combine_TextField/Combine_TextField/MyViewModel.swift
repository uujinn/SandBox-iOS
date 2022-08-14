//
//  MyViewModel.swift
//  Combine_TextField
//
//  Created by 양유진 on 2022/07/05.
//

import Foundation
import Combine

class MyViewModel {
  // published 어노테이션을 통해 구독이 가능하도록 설정
  @Published var passwordInput: String = ""{
    didSet{
      print("MyViewModel / passwordInput: \(passwordInput)")
    }
  }
  @Published var passwordConfirmInput: String = ""{
    didSet{
      print("MyViewModel / passwordConfirmInput: \(passwordConfirmInput)")
    }
  }
  
  // 들어온 퍼블리셔들의 값 일치 여부를 반환하는 퍼블리셔
  lazy var isMatchingPasswordInput: AnyPublisher<Bool, Never> = Publishers
    .CombineLatest($passwordInput, $passwordConfirmInput)
    .map({ ( password: String, passwordConfirm: String) in
      if password == "" || passwordConfirm == "" {
        return false
      }
      
      if password == passwordConfirm {
        return true
      }else{
        return false
      }
    })
    .print()
    .eraseToAnyPublisher()
  
  
  
}
