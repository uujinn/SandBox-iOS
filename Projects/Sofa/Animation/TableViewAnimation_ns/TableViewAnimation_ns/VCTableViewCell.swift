//
//  VCTableViewCell.swift
//  TableViewAnimation_ns
//
//  Created by 양유진 on 2022/05/22.
//

import UIKit
import SnapKit

class VCTableViewCell: UITableViewCell {
    
    static let identifier = "VCTableViewCell"
    
    let img: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "Image")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        return imgView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "1st"
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addContentView()
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    private func addContentView(){
        contentView.addSubview(img)
        contentView.addSubview(label)
//        self.contentView.backgroundColor = .purple
    }
    private func autoLayout(){
        img.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.size.width.height.equalTo(75)
            $0.leading.equalToSuperview().offset(20)
        }
        
        label.snp.makeConstraints{
            $0.leading.equalTo(img.snp.trailing).offset(20)
            $0.centerY.equalToSuperview()
        }
    }
}
