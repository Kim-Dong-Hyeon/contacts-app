//
//  PhoneBookView.swift
//  ContactsApp
//
//  Created by 김동현 on 7/17/24.
//

import UIKit
import SnapKit

class PhoneBookView: UIView {
  
  let profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.layer.cornerRadius = 90
    imageView.layer.borderColor = UIColor.gray.cgColor
    imageView.layer.borderWidth = 2
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  let randomImageButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("랜덤 이미지 생성", for: .normal)
    button.tintColor = .gray
    return button
  }()
  let nameTextField: UITextField = {
    let textField = UITextField()
    textField.borderStyle = .roundedRect
    textField.placeholder = "이름"
    return textField
  }()
  let phoneNumberTextField: UITextField = {
    let textField = UITextField()
    textField.borderStyle = .roundedRect
    textField.placeholder = "전화번호"
    return textField
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureUI() {
    self.backgroundColor = .white

    [
      profileImageView,
      randomImageButton,
      nameTextField,
      phoneNumberTextField
    ].forEach { self.addSubview($0) }
    
    profileImageView.snp.makeConstraints {
      $0.top.equalTo(self.safeAreaLayoutGuide).offset(40)
      $0.centerX.equalToSuperview()
      $0.width.height.equalTo(180)
    }
    
    randomImageButton.snp.makeConstraints {
      $0.top.equalTo(profileImageView.snp.bottom).offset(10)
      $0.centerX.equalToSuperview()
    }
    
    nameTextField.snp.makeConstraints {
      $0.top.equalTo(randomImageButton.snp.bottom).offset(20)
      $0.leading.trailing.equalToSuperview().inset(20)
      $0.height.equalTo(40)
    }
    
    phoneNumberTextField.snp.makeConstraints {
      $0.top.equalTo(nameTextField.snp.bottom).offset(10)
      $0.leading.trailing.equalToSuperview().inset(20)
      $0.height.equalTo(40)
    }
  }
}
