//
//  ExampleThreeViewController.swift
//  SeSac3Week6
//
//  Created by 이상남 on 2023/08/23.
//

import UIKit
import SnapKit

class ExampleThreeViewController: UIViewController {

    lazy var UIList: [UIView] = [backView,dateLabel,locationStackView,conten1View,conten2View,conten3View]
    
    let backView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backImage")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let dateLabel = {
        let label = UILabel()
        label.text = "10월 24일 09시 42분"
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    //두번쨰줄 위치 스택뷰
    let locationStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        return stack
    }()
    //스택뷰 요소
    let locationButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let locationLabel = {
        let label = UILabel()
        label.text = "위치가 들어갈 자리"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    
    let shareButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let resetButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        button.tintColor = .white
        return button
    }()
    //채팅 메세지뷰  텍스트 한세트
    let conten1View = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 10
        return view
    }()
    
    let content1Label = {
        let label = UILabel()
        label.text = "지금은 9c 에요"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    // 한칸마다 반복
    let conten2View = {
        let view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        return view
    }()
    
    let content2Label = {
        let label = UILabel()
        label.text = "너무 졸리네요"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    //줄일 수 있을듯
    let conten3View = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 10
        return view
    }()
    
    let content3Label = {
        let label = UILabel()
        label.text = "지금은 4시에요 일단 자야겠어요"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIList.forEach {
            view.addSubview($0)
        }
        
        locationStackView.addArrangedSubview(locationButton)
        locationStackView.addArrangedSubview(locationLabel)
        locationStackView.addArrangedSubview(shareButton)
        locationStackView.addArrangedSubview(resetButton)
        
        conten1View.addSubview(content1Label)
        conten2View.addSubview(content2Label)
        conten3View.addSubview(content3Label)
        
        setUpConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    func setUpConstraints(){
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.height.equalTo(20)
        }
        locationStackView.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        locationButton.snp.makeConstraints { make in
            make.size.equalTo(40)
            make.verticalEdges.leading.equalToSuperview()
        }
        shareButton.snp.makeConstraints { make in
            make.size.equalTo(40)
            make.verticalEdges.equalToSuperview()
        }
        resetButton.snp.makeConstraints { make in
            make.size.equalTo(40)
            make.verticalEdges.trailing.equalToSuperview()
        }
        
        conten1View.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.top.equalTo(locationStackView.snp.bottom).offset(20)
        }
        content1Label.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        
        conten2View.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.top.equalTo(conten1View.snp.bottom).offset(20)
        }
        content2Label.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        
        conten3View.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.top.equalTo(conten2View.snp.bottom).offset(20)
        }
        content3Label.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        
    }
    
    
    
}
