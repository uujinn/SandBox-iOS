//
//  ViewController.swift
//  Combine_TextField
//
//  Created by 양유진 on 2022/07/05.
//

import UIKit
import Combine

class ViewController: UIViewController {
  
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var passwordConfirmTextField: UITextField!
  @IBOutlet weak var myButton: UIButton!
  
  var viewModel: MyViewModel!
  
  private var mySubscriptions = Set<AnyCancellable>()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    viewModel = MyViewModel()
    
    // 텍스트필드에서 나가는 이벤트를 뷰모델의 프로퍼티가 구독
    passwordTextField
      .myTextPublisher
//      .print()
    // 스레드 - 메인에서 받겠다.
      .receive(on: DispatchQueue.main)
    // 구독
      .assign(to: \.passwordInput, on: viewModel)
      .store(in: &mySubscriptions)
    

    passwordConfirmTextField
      .myTextPublisher
//      .print()
    // 스레드 - 메인에서 받겠다.
    // 다른 스레드와 같이 작업하기 때문에 RunLoop로 돌리기
      .receive(on: RunLoop.main)
    // 구독
      .assign(to: \.passwordConfirmInput, on: viewModel)
      .store(in: &mySubscriptions)
    
    // 버튼이 뷰모델의 퍼블리셔를 구독
    viewModel.isMatchingPasswordInput
      .print()
      .receive(on: RunLoop.main)
    // 구독
      .assign(to: \.isValid, on: myButton)
      .store(in: &mySubscriptions)
  }

  
}

extension UITextField {
  var myTextPublisher: AnyPublisher<String, Never> {
    NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
      .print()
    // UITextField 가져옴
      .compactMap{ $0.object as? UITextField }
    // String 가져옴
      .map{ $0.text ?? "" }
      .print()
      .eraseToAnyPublisher()
  }
}

extension UIButton {
  var isValid: Bool {
    get {
      backgroundColor == .yellow
    }
    set {
      backgroundColor = newValue ? .yellow : .lightGray
      isEnabled = newValue
      setTitleColor(newValue ? .blue: .white, for: .normal)
    }
  }
}
