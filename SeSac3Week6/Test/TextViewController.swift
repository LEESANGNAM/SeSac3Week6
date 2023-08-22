//
//  TextViewController.swift
//  SeSac3Week6
//
//  Created by 이상남 on 2023/08/22.
//

import UIKit
import SnapKit

class TextViewController: UIViewController {
    
//    func setImageView() -> UIImageView {
//        let view = UIImageView()
//        view.backgroundColor = .blue
//        view.contentMode = .scaleAspectFill
//        return view
//    }
    // 클로저
    let photoImageView = {
        let view = UIImageView()
        view.backgroundColor = .blue
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let titleTextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = "제목을 입력해주세요"
        textField.textAlignment = .center
        textField.font = .boldSystemFont(ofSize: 15)
        return textField
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        
        
        for item in [photoImageView, titleTextField]{
            view.addSubview(item)
        }
        
//        [photoImageView, titleTextField].forEach {  in
//            view.addSubview($0)
//        }
        
        setUpConstraints()
        
        
    }
    
    
    func setUpConstraints(){
        photoImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view).multipliedBy(0.3)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
//            make.leadingMargin.equalTo(20)
//            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
    }
    
    
    
}
