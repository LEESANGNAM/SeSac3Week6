//
//  SnapViewController.swift
//  SeSac3Week6
//
//  Created by 이상남 on 2023/08/22.
//

import UIKit
import SnapKit
/*
 addSubView 위치
 superView
 offset inset
 RTL Rigth To Left
 현지화
 */


class SnapViewController: UIViewController {
    
    let redView = UIView()
    let whiteView = UIView()
    let blueView = UIView()
    let yellowView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        // Do any additional setup after loading the view.
        
        view.addSubview(redView)
        redView.backgroundColor = .red
        
        redView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(150)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        view.addSubview(whiteView)
        whiteView.backgroundColor = .white
        whiteView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
//            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
//            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(200)
        }
        
        view.addSubview(blueView)
        blueView.backgroundColor = .blue
        
        blueView.snp.makeConstraints { make in
            make.size.equalTo(200)
//          make.height.width.equalTo(200)
            make.center.equalTo(view)
//          make.centerX.centerY.equalTo(view)
        }
        
        blueView.addSubview(yellowView)
        yellowView.backgroundColor = .yellow
        
        yellowView.snp.makeConstraints { make in
            make.size.equalTo(150)
//            make.leading.top.equalToSuperview()
//            make.center.equalToSuperview()
//            make.top.trailing.leading.bottom.equalToSuperview()
            make.edges.equalTo(blueView).offset(50)
        }
        
        
        
    }
    

  

}
