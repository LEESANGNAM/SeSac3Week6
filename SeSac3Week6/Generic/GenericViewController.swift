//
//  GenericViewController.swift
//  SeSac3Week6
//
//  Created by 이상남 on 2023/08/24.
//

import UIKit
import SnapKit

class GenericViewController: UIViewController {
    
    let sampleLabel = UILabel()
    let sampleButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "네비게이션"
        navigationController?.navigationBar.backgroundColor = .white
        let button = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: #selector(backButtonTapped))
        navigationController?.navigationItem.leftBarButtonItem
        view.backgroundColor = .blue
        view.addSubview(sampleLabel)
        sampleLabel.backgroundColor = .yellow
        configureBorder(view: sampleLabel)
        sampleLabel.text = "제네릭 테스트"
        sampleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(50)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(50)
        }
        view.addSubview(sampleButton)
        sampleButton.backgroundColor = .green
        configureBorder(view: sampleButton)
        sampleButton.setTitle("제네릭 테스트 버튼", for: .normal)
        sampleButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(50)
            make.top.equalTo(sampleLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        let generic = sum(a: 4.5, b: 5.7)
        print(generic)

        let generic2 = sum(a: 4, b: 5)
        print(generic2)
        
        let sumNum = sumInt(a: 3, b: 7)
        print(sumNum)
        let sumDoubleNum = sumDouble(a: 3.5, b: 7.6)
        print(sumDoubleNum)
        
    }
    
    @objc func backButtonTapped(){
        dismiss(animated: true)
    }
    

   

}
