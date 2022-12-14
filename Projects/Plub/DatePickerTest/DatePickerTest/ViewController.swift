//
//  ViewController.swift
//  DatePickerTest
//
//  Created by 양유진 on 2022/08/14.
//

import UIKit

class ViewController: UIViewController {
  
  private let datePicker = UIDatePicker()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  
  // MARK: - UI
  private func configureUI() {
    setAttributes()
    setContraints()
  }
  
  private func setAttributes() {
    datePicker.preferredDatePickerStyle = .inline
    datePicker.datePickerMode = .dateAndTime
    
    datePicker.locale = Locale(identifier: "ko-KR")
    datePicker.timeZone = .autoupdatingCurrent
    datePicker.addTarget(self, action: #selector(handleDatePicker(_:)), for: .valueChanged)
  }
  
  private func setContraints() {
    view.addSubview(datePicker)
    datePicker.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
      datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
      datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ])
  }
  
  // MARK: - Selectors
  @objc
  private func handleDatePicker(_ sender: UIDatePicker) {
    print(sender.date)
  }
}
