//
//  CustomTableViewCell.swift
//  SeSac3Week6
//
//  Created by 이상남 on 2023/08/25.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let label = UILabel()
    let button = UIButton()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
        setUpConstraints() //addSubView이후에 constraits 설정
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpUI(){
//        view.addSubview(label)
//        addSubview(label)  오류가 안생김. 레이아웃 적용은 안됨.
        contentView.addSubview(label)
        contentView.addSubview(button)
        label.backgroundColor = .yellow
        button.backgroundColor = .green
    }
    
    func setUpConstraints(){
        button.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.centerY.trailing.equalTo(contentView)
        }
        label.snp.makeConstraints { make in
            make.top.leadingMargin.bottom.equalTo(contentView)
            make.trailing.equalTo(button.snp.leading).inset(8)
        }
    }
    
    
    // Interface Builder
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
