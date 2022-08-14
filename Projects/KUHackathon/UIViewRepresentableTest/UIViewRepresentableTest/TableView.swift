//
//  TableView.swift
//  UIViewRepresentableTest
//
//  Created by 양유진 on 2022/08/14.
//

import Foundation
import UIKit
import SwiftUI

struct TableView: UIViewRepresentable{
  @Binding var presented: Bool
  
  func makeUIView(context: Context) -> UITableView{
    let view = UITableView()
    
    return view
  }
  
  func updateUIView(_ uiView: UITableView, context: Context) {
    if self.presented{
      uiView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
      uiView.delegate = context.coordinator
      uiView.dataSource = context.coordinator
    }
  }
  
  func makeCoordinator() -> Coordinator {
    return Coordinator()
  }
  
  class Coordinator: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      cell.textLabel?.text = _contents[indexPath.row]
      
      return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return _contents.count
    }
    
    var _contents = [
      "Apple",
      "Banana",
      "Melon"
    ]
  }
}
