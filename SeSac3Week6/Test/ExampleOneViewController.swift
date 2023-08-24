//
//  TextViewController.swift
//  SeSac3Week6
//
//  Created by 이상남 on 2023/08/22.
//

import UIKit
import SnapKit

class TextViewController: UIViewController {
    
    //1.
    let picker = UIImagePickerController()
    
    
    let photoImageView = {
        let view = UIImageView()
        view.backgroundColor = .blue
        view.contentMode = .scaleAspectFill
        return view
    }()
    //    func setImageView() -> UIImageView {
    //        let view = UIImageView()
    //        view.backgroundColor = .blue
    //        view.contentMode = .scaleAspectFill
    //        return view
    //    }
        // 클로저
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
    let dateTextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = "날짜를 입력해주세요"
        textField.textAlignment = .center
        textField.font = .boldSystemFont(ofSize: 15)
        return textField
    }()
    
    let bottomImageView = {
        let view = UIImageView()
        view.backgroundColor = .yellow
        view.contentMode = .scaleAspectFill
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    lazy var UIList:[UIView] = [photoImageView, titleTextField, dateTextField,bottomImageView]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        for item in UIList{
            view.addSubview(item)
        }
        setUpConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //2. 사용 가능한지 체크
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("갤러리 사용불가, 사용자에게 토스트/얼럿")
            return
        }
//        let picker = UIColorPickerViewController() //UIFontPickerViewController()
        picker.delegate = self
        picker.sourceType = .camera  //.photoLibrary // 사진만 가져오는건 권한 설정 필요없다.
        picker.allowsEditing = true
        present(picker, animated: true)
        
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
            make.height.equalTo(50)
        }
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(50)
        }
        bottomImageView.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(dateTextField.snp.bottom).offset(20)
        }
    }
}

extension TextViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
 
    //캔슬
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
        print(#function)
    }
    //사진 선택이나 카메라 촬영 직후호출
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            self.photoImageView.image = image
            dismiss(animated: true)
            
        }
    }
    
}
