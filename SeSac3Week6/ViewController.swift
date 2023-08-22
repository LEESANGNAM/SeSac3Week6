//
//  ViewController.swift
//  SeSac3Week6
//
//  Created by 이상남 on 2023/08/21.
//

import UIKit

// 1. 객체 올리고, 레이아웃잡고, 아웃렛연결, 속성 조절

// 1. 뷰 객체 프로퍼티 선언 ( 클래스 인스턴스 생성)
// 2. 명시적으로 루트뷰에 추가 view.addSubview(emailTextField), (translatesAutoresizingMaskIntoConstraints)
// 3. 크기와 위치 정의
// 4. 속성 정의
// => AutoResizingMask, AutoLayout -> 스토리보드 대응
// NSLayoutConstraints -> 코드베이스
    //1. isActive
    //2. addConstraints
// -> NSLayoutAnchor
class ViewController: UIViewController {
    
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let exampleOneButton = UIButton()
    let exampleTwoButton = UIButton()
    let exampleThreeButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false // default true
        
        emailTextField.frame = CGRect(x: 50, y: 80, width: UIScreen.main.bounds.width - 100, height: 50)
        
        emailTextField.backgroundColor = .lightGray
        emailTextField.isSecureTextEntry = true
        emailTextField.keyboardType = .numberPad
        emailTextField.placeholder = "닉네임 입력"
        
        // 레이아웃 활성화
//        NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50).isActive = true
//        NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50).isActive = true
//        NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60).isActive = true
//        NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 50).isActive = true
//
        //addConstraints
        let leading =  NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50)
        let trailing = NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50)
        let height = NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60)
        let top = NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 50)
        
        
        view.addConstraints([leading,trailing,height,top])
        
        
        passwordTextField.backgroundColor = .blue
        passwordTextField.isSecureTextEntry = true
        passwordTextField.keyboardType = .default
        passwordTextField.placeholder = "비밀번호 입력"
        
        
        setExampleThreeButtonLayoutAnchor()
        setExampleTwoButtonLayoutAnchor()
        setExampleOneButtonLayoutAnchor()
        
        
    }
    
    @objc
    func exampleOneButtonTapped(){
        
        let vc = TextViewController()
        
        present(vc,animated: true)
        
    }
    @objc
    func exampleTwoButtonTapped(){
        
        let vc = ExampleTwoViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true)
        
    }
    @objc
    func exampleThreeButtonTapped(){
        
        let vc = TextViewController()
        
        present(vc,animated: true)
        
    }
    
    func setExampleOneButtonLayoutAnchor(){
        
        exampleOneButton.addTarget(self, action: #selector(exampleOneButtonTapped), for: .touchUpInside)
        
        view.addSubview(exampleOneButton)
        exampleOneButton.translatesAutoresizingMaskIntoConstraints = false
        exampleOneButton.backgroundColor = .red
        exampleOneButton.setTitle("Exampl_1이동", for: .normal)
        exampleOneButton.setTitleColor(.black, for: .normal)
        
        
        NSLayoutConstraint.activate([
            exampleOneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            exampleOneButton.widthAnchor.constraint(equalToConstant: 300),
            exampleOneButton.heightAnchor.constraint(equalToConstant: 50),
            exampleOneButton.bottomAnchor.constraint(equalTo: exampleTwoButton.topAnchor,constant: -20)
            
        ])
        
    }
    
    func setExampleTwoButtonLayoutAnchor(){
        
        exampleTwoButton.addTarget(self, action: #selector(exampleTwoButtonTapped), for: .touchUpInside)
        
        view.addSubview(exampleTwoButton)
        exampleTwoButton.translatesAutoresizingMaskIntoConstraints = false
        exampleTwoButton.backgroundColor = .orange
        exampleTwoButton.setTitle("Exampl_2이동", for: .normal)
        exampleTwoButton.setTitleColor(.black, for: .normal)
        
        
        NSLayoutConstraint.activate([
            exampleTwoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            exampleTwoButton.widthAnchor.constraint(equalToConstant: 300),
            exampleTwoButton.heightAnchor.constraint(equalToConstant: 50),
            exampleTwoButton.bottomAnchor.constraint(equalTo: exampleThreeButton.topAnchor,constant: -20)
            
        ])
        
    }
    
    func setExampleThreeButtonLayoutAnchor(){
        
        exampleThreeButton.addTarget(self, action: #selector(exampleThreeButtonTapped), for: .touchUpInside)
        
        view.addSubview(exampleThreeButton)
        exampleThreeButton.translatesAutoresizingMaskIntoConstraints = false
        exampleThreeButton.backgroundColor = .yellow
        exampleThreeButton.setTitle("Exampl_3이동", for: .normal)
        exampleThreeButton.setTitleColor(.black, for: .normal)
        
        
        NSLayoutConstraint.activate([
            exampleThreeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            exampleThreeButton.widthAnchor.constraint(equalToConstant: 300),
            exampleThreeButton.heightAnchor.constraint(equalToConstant: 50),
            exampleThreeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        
    }
    
}

