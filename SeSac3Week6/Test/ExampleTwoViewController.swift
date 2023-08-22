//
//  ExampleTwoViewController.swift
//  SeSac3Week6
//
//  Created by 이상남 on 2023/08/22.
//

import UIKit
import SnapKit

class ExampleTwoViewController: UIViewController {
    
    lazy var UIList:[UIView] = [backImageView,stackView,lineView,nameLabel,contentLabel,profileIamgeView,closeButton,menuStackView]
    //배경
    let backImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backImage")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    //우측상단 메뉴버튼 스택뷰
    let menuStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0
        stack.distribution = .fill
        return stack
    }()
    //스택뷰 1
    let shopButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "cart.circle"), for: .normal)
        button.tintColor = .white
        return button
    }()
    //스택뷰 2
    let qrButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "qrcode"), for: .normal)
        button.tintColor = .white
        return button
    }()
    //스택뷰 3
    let settingButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gearshape.circle"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    //상단왼쪽 닫기
    let closeButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    //프로필
    let profileIamgeView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.layer.cornerRadius = 40
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    //이름
    let nameLabel = {
        let label = UILabel()
        label.text = "잠만보"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    //상태메세지
    let contentLabel = {
        let label = UILabel()
        label.text = "잠만보는 잠이많아요 zZzZ"
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    // 하단 구분선
    let lineView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    // 하단 스택뷰
    let stackView = {
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.spacing = 15
        stack.distribution = .equalSpacing
        return stack
    }()
    
    // 버튼 + 텍스트 들어갈 뷰
    let firstView = {
        let view = UIView()
        
        return view
    }()
    let secondView = {
        let view = UIView()
        
        return view
    }()
    let thirdView = {
        let view = UIView()
        return view
    }()
    
    // 뷰1
    let chatButton =  {
        let button = UIButton()
        button.setImage(UIImage(systemName: "message.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let chatLabel = {
        let label = UILabel()
        label.text = "나와의 채팅"
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    // 뷰2
    let profileButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "figure.walk"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let profileLabel = {
        let label = UILabel()
        label.text = "프로필 편집"
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    // 뷰3
    let storyButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "airplane"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let storyLabel = {
        let label = UILabel()
        label.text = "카카오 스토리"
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        UIList.forEach {
            view.addSubview($0)
        }
        //하단 스택뷰에 추가할 뷰
        stackView.addArrangedSubview(firstView)
        stackView.addArrangedSubview(secondView)
        stackView.addArrangedSubview(thirdView)
        
        //뷰에 추가할 버튼 레이블
        firstView.addSubview(chatButton)
        firstView.addSubview(chatLabel)
        secondView.addSubview(profileButton)
        secondView.addSubview(profileLabel)
        thirdView.addSubview(storyButton)
        thirdView.addSubview(storyLabel)
        
        //상단 메뉴스텍뷰
        menuStackView.addArrangedSubview(shopButton)
        menuStackView.addArrangedSubview(qrButton)
        menuStackView.addArrangedSubview(settingButton)
        
        
        setUpConstraints()
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    @objc func closeButtonTapped(){
        dismiss(animated: true)
    }
    
    func setUpConstraints(){
        backImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        menuStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        shopButton.snp.makeConstraints { make in
            make.size.equalTo(40)
        }
        qrButton.snp.makeConstraints { make in
            make.size.equalTo(40)
        }
        settingButton.snp.makeConstraints { make in
            make.size.equalTo(40)
        }
        
        
        
        closeButton.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide)
            make.size.equalTo(40)
        }
        
        
        profileIamgeView.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(profileIamgeView.snp.height)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(nameLabel.snp.top).offset(-10)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(contentLabel.snp.top).offset(-10)
        }
    
        contentLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(lineView.snp.top).offset(-20)
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.horizontalEdges.equalTo(view)
            make.bottom.equalTo(stackView.snp.top).offset(-20)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.height.equalTo(60)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        
        firstView.snp.makeConstraints { make in
            //            make.top.bottom.equalToSuperview()
            //            make.leading.equalTo(stackView.snp.leading)
            
            
        }
        secondView.snp.makeConstraints { make in
            //            make.top.bottom.equalToSuperview()
            
        }
        thirdView.snp.makeConstraints { make in
            //            make.top.bottom.equalToSuperview()
            //            make.trailing.equalTo(stackView.snp.trailing)
            
        }
        
        chatLabel.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalToSuperview()
            make.height.equalTo(20)
        }
        profileLabel.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalToSuperview()
            make.height.equalTo(20)
        }
        storyLabel.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalToSuperview()
            make.height.equalTo(20)
        }
        
        chatButton.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(chatLabel.snp.top)
        }
        profileButton.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(profileLabel.snp.top)
        }
        storyButton.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(storyLabel.snp.top)
        }
        
        
        
    }
    
    
    
}
