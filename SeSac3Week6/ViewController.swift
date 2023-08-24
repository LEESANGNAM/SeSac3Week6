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
    let customTableButton = UIButton()
    let customButton = UIButton()
    let genericButton = UIButton()
    let locationButton = UIButton()
    let exampleOneButton = UIButton()
    let exampleTwoButton = UIButton()
    let exampleThreeButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
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
        setLocationButtonLayoutAnchor()
        setGenericButtonLayoutAnchor()
        customButtonLayoutAnchor()
        customTableButtonLayoutAnchor()
    }
    @objc
    func locationButtonTapped(){
        let vcType = LocationViewController.self
        transition(viewController:vcType, style: .presentNavigation)
    }
    @objc
    func exampleOneButtonTapped(){
        let vcType = TextViewController.self
        transition(viewController:vcType, style: .fullScreen)
    }
    @objc
    func exampleTwoButtonTapped(){
        let vcType = ExampleTwoViewController.self
        transition(viewController:vcType, style: .fullScreen)
    }
    @objc
    func exampleThreeButtonTapped(){
        let vcType = ExampleThreeViewController.self
        transition(viewController:vcType, style: .present)
    }
    @objc
    func genericButtonTapped(){
        transition(viewController: GenericViewController.self, style: .presentFullNavigation)
    }
    @objc
    func customButtonTapped(){
        transition(viewController: CustomViewController.self, style: .present)
    }
    
    @objc
    func customTableButtonTapped(){
        transition(viewController: CustomTableViewController.self, style: .present)
    }
    
    
    
    func setExampleOneButtonLayoutAnchor(){
        
        exampleOneButton.addTarget(self, action: #selector(exampleOneButtonTapped), for: .touchUpInside)
        
        view.addSubview(exampleOneButton)
        exampleOneButton.translatesAutoresizingMaskIntoConstraints = false
        exampleOneButton.backgroundColor = .yellow
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
        exampleThreeButton.backgroundColor = .red
        exampleThreeButton.setTitle("Exampl_3이동", for: .normal)
        exampleThreeButton.setTitleColor(.black, for: .normal)
        
        
        NSLayoutConstraint.activate([
            exampleThreeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            exampleThreeButton.widthAnchor.constraint(equalToConstant: 300),
            exampleThreeButton.heightAnchor.constraint(equalToConstant: 50),
            exampleThreeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        
    }
    func setLocationButtonLayoutAnchor(){
        
        locationButton.addTarget(self, action: #selector(locationButtonTapped), for: .touchUpInside)
        
        view.addSubview(locationButton)
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.backgroundColor = .green
        locationButton.setTitle("location", for: .normal)
        locationButton.setTitleColor(.black, for: .normal)
        
        
        NSLayoutConstraint.activate([
            locationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            locationButton.widthAnchor.constraint(equalToConstant: 300),
            locationButton.heightAnchor.constraint(equalToConstant: 50),
            locationButton.bottomAnchor.constraint(equalTo: exampleOneButton.topAnchor,constant: -20)
            
        ])
        
    }
    func setGenericButtonLayoutAnchor(){
        
        genericButton.addTarget(self, action: #selector(genericButtonTapped), for: .touchUpInside)
        
        view.addSubview(genericButton)
        genericButton.translatesAutoresizingMaskIntoConstraints = false
        genericButton.backgroundColor = .systemBlue
        genericButton.setTitle("genericButton", for: .normal)
        genericButton.setTitleColor(.black, for: .normal)
        
        
        NSLayoutConstraint.activate([
            genericButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            genericButton.widthAnchor.constraint(equalToConstant: 300),
            genericButton.heightAnchor.constraint(equalToConstant: 50),
            genericButton.bottomAnchor.constraint(equalTo: locationButton.topAnchor,constant: -20)
            
        ])
        
    }
    func customButtonLayoutAnchor(){
        
        customButton.addTarget(self, action: #selector(customButtonTapped), for: .touchUpInside)
        
        view.addSubview(customButton)
        customButton.translatesAutoresizingMaskIntoConstraints = false
        customButton.backgroundColor = .blue
        customButton.setTitle("customViewButton", for: .normal)
        customButton.setTitleColor(.black, for: .normal)
        
        
        NSLayoutConstraint.activate([
            customButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customButton.widthAnchor.constraint(equalToConstant: 300),
            customButton.heightAnchor.constraint(equalToConstant: 50),
            customButton.bottomAnchor.constraint(equalTo: genericButton.topAnchor,constant: -20)
            
        ])
        
    }
    func customTableButtonLayoutAnchor(){
        
        customTableButton.addTarget(self, action: #selector(customTableButtonTapped), for: .touchUpInside)
        
        view.addSubview(customTableButton)
        customTableButton.translatesAutoresizingMaskIntoConstraints = false
        customTableButton.backgroundColor = .systemPurple
        customTableButton.setTitle("customViewButton", for: .normal)
        customTableButton.setTitleColor(.black, for: .normal)
        
        
        NSLayoutConstraint.activate([
            customTableButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customTableButton.widthAnchor.constraint(equalToConstant: 300),
            customTableButton.heightAnchor.constraint(equalToConstant: 50),
            customTableButton.bottomAnchor.constraint(equalTo: customButton.topAnchor,constant: -20)
            
        ])
        
    }
    
}

