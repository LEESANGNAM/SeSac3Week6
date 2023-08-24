//
//  BlackRadiusTextField.swift
//  SeSac3Week6
//
//  Created by 이상남 on 2023/08/24.
//

import UIKit

class BlackRadiusTextField: UITextField {
    
    // interface Builder를 사용하지 않고, UIView를 상속받은 custom Class를 코드로 구성할 때 사용되는 초기화 구문
    override init(frame: CGRect) { // UIView Init()
        super.init(frame: frame)
        setUpTextField()
    }
    
    // 왜써야하나 ui  XIB -> Nib 으로 변환될 때 실행 -> 스토리보드
    // interface Builder에서 생성된 뷰들이 초기화될 때 실행되는 구문!
    required init?(coder: NSCoder) { // NSCoding
        fatalError("init(coder:) has not been implemented")
    }
    func setUpTextField(){
        borderStyle = .none
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
        textColor = .black
        textAlignment = .center
        font = .boldSystemFont(ofSize: 15)
    }
//    func setUpPlaceHolder(placeholder: String){
//        self.placeholder = placeholder
//    }
    
}

// MARK: - required
protocol ExampleProtocol {
    init(name: String)
}

//required: 프로토콜에서 생성된 경우 사용하는 키워드
class Mobile: ExampleProtocol{
    required init(name: String) { //protocol 에서 생성한 init
        
    }
    
    
}


