//
//  ViewController.swift
//  TableViewAnimation
//
//  Created by 양유진 on 2022/05/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arr: [String] = ["1st", "2nd", "3rd", "4th", "5th"]
    var indexArr: [Int] = [0, 1, 2, 3, 4]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        tableView.register(UINib(nibName: "SampleCell", bundle: nil), forCellReuseIdentifier: "SampleCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func pressedToRefresh(_ sender: Any) {
//        print(arr)
        self.arr = arr.shuffled()
        
//        self.tableView.reloadData()
//        self.tableView.cellForRow(at: [0,3]).moveRo\
        UIView.transition(with: tableView, duration: 0.6, options: .beginFromCurrentState, animations: { [self] in self.tableView.moveRow(at: [0, Int(indexArr.randomElement()!)], to: [0, Int(indexArr.randomElement()!)]) })
        UIView.transition(with: tableView, duration: 0.6, options: .beginFromCurrentState, animations: { [self] in self.tableView.moveRow(at: [0, Int(indexArr.randomElement()!)], to: [0, Int(indexArr.randomElement()!)]) })
        UIView.transition(with: tableView, duration: 0.6, options: .beginFromCurrentState, animations: { [self] in self.tableView.moveRow(at: [0, Int(indexArr.randomElement()!)], to: [0, Int(indexArr.randomElement()!)]) })
//        self.tableView.moveRow(at: [0, Int(indexArr.randomElement()!)], to: [0, Int(indexArr.randomElement()!)])
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SampleCell", for: indexPath) as! SampleCell
        
        cell.label.text = arr[indexPath.row]
        print(indexPath)
        
        return cell
    }
    
    
}
