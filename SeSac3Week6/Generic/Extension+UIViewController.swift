//
//  Extension+UIViewController.swift
//  SeSac3Week6
//
//  Created by 이상남 on 2023/08/24.
//

import UIKit

extension UIViewController{
    enum TransitionType {
        case present //네비게이션 없이 presnet
        case presentNavigation // 네비게이션 임베드 된 present
        case presentFullNavigation // 네비게이션 임베드 된 fullscreen present
        case push
    }
    /*
     "고래밥" -> String
     String -> Stirng.self > String.Type
     */
    // transition(viewController: GenericViewController.self, storyBoard: "Main", style: .present)
    func transition<T: UIViewController>(viewController: T.Type, storyBoard: String, style: TransitionType) {
        let sb = UIStoryboard(name: storyBoard, bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: String(describing: viewController)) as? T else { return }
        switch style {
        case .present:
            present(vc,animated: true)
        case .presentNavigation:
            let nav = UINavigationController(rootViewController: vc)
            present(nav,animated: true)
        case .presentFullNavigation:
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav,animated: true)
        case .push:
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    //T Type Parameter: 타입의 종류는 알려주지 않지만, 모두 같은 타입이 들어갈 것을 암시. 플레이스 홀더와 같은 역할
    //: UIView -> Type Constraints 타입 제약 -> 클래스 제약, 프로토콜 제약
    //U UpperCased
    func configureBorder<T: UIView>(view: T){
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
    }
    func configureBorder(view: UILabel){
        
    }
    func configureBorder(view: UIButton){
        
    }
    
    // Generic: 타입에 유연하게 대응하기 위한 요소
    // 코드 중복과 재사용에 대응하기가 좋아서 추상적인 표현 가능
    func sum<T: AdditiveArithmetic>(a: T, b: T) -> T {
        return a + b
    }
    
    
    func sumInt(a: Int, b: Int) -> Int{
        return a + b
    }
    func sumDouble(a: Double, b: Double) -> Double{
        return a + b
    }
    
}
