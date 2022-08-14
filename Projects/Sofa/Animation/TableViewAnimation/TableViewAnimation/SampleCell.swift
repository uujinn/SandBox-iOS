//
//  SampleCell.swift
//  TableViewAnimation
//
//  Created by 양유진 on 2022/05/13.
//

import UIKit

class SampleCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
