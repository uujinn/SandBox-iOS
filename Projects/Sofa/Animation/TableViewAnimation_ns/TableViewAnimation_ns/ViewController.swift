//
//  ViewController.swift
//  TableViewAnimation_ns
//
//  Created by 양유진 on 2022/05/22.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
  
  var arr: [String] = ["1st", "2nd", "3rd", "4th", "5th", "6th", "7th", "8th"]
  var indexArr: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  
  private let tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(VCTableViewCell.self, forCellReuseIdentifier: VCTableViewCell.identifier)
    return tableView
  }()
  
  private let button = UIButton().then {
    $0.setTitle("CLICK", for: .normal)
    $0.backgroundColor = .darkGray
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = .white
    
    self.configure()
    self.addSubView()
    self.autoLayout()
  }
  
  
}

extension ViewController{
  private func configure(){
    tableView.dataSource = self
    tableView.rowHeight = 200
    tableView.delegate = self
    
    tableView.separatorStyle = .none
    
    self.button.addTarget(self, action: #selector(didTappedMoveCell(_:)), for: .touchUpInside)
  }
  
  private func addSubView(){
    view.addSubview(tableView)
    view.addSubview(button)
  }
  
  private func autoLayout(){
    tableView.snp.makeConstraints{
      $0.edges.equalTo(view.safeAreaLayoutGuide)
        .inset(UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0))
    }
    
    button.snp.makeConstraints{
      $0.top.equalTo(self.tableView.snp.top).offset(-30)
      $0.trailing.equalToSuperview().offset(-20)
      //            $0.size.width.height.equalTo(50)
      //            $0.size.width.width.equalTo(50)
      
    }
  }
  
  @objc
  private func didTappedMoveCell(_ sender: UIButton){
    UIView.transition(with: tableView, duration: 0.6, options: .beginFromCurrentState, animations: { [self] in self.tableView.moveRow(at: [0, Int(indexArr.randomElement()!)], to: [0, Int(indexArr.randomElement()!)]) })
  }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arr.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: VCTableViewCell.identifier, for: indexPath) as! VCTableViewCell
    cell.img.image = UIImage(named: "Image")
    cell.label.text = arr[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("select \(indexPath.row)")
  }
  
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if tableView.contentOffset.y > (tableView.contentSize.height - self.tableView.frame.size.height - 100 ) {
      print("끝에 도달")
      
    }
  }
}
