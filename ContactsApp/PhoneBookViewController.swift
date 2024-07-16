//
//  PhoneBookViewController.swift
//  ContactsApp
//
//  Created by 김동현 on 7/16/24.
//

import UIKit
import SnapKit

class PhoneBookViewController: UIViewController {
  
  private let profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.layer.cornerRadius = 90
    imageView.layer.borderColor = UIColor.gray.cgColor
    imageView.layer.borderWidth = 2
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  private let randomImageButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("랜덤 이미지 생성", for: .normal)
    button.tintColor = .gray
    return button
  }()
  private let nameTextField: UITextField = {
    let textField = UITextField()
    textField.borderStyle = .roundedRect
    textField.placeholder = "이름"
    return textField
  }()
  private let phoneNumberTextField: UITextField = {
    let textField = UITextField()
    textField.borderStyle = .roundedRect
    textField.placeholder = "전화번호"
    return textField
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    setupNavigationBar()
  }
  
  private func setupNavigationBar() {
    self.title = "연락처 추가"
    
    let applyButton = UIBarButtonItem(title: "적용", style: .plain, target: self, action: #selector(applyButtonTapped))
    navigationItem.rightBarButtonItem = applyButton
  }
  
  private func configureUI() {
    view.backgroundColor = .white
    
    randomImageButton.addTarget(self, action: #selector(randomImageButtonTapped), for: .touchDown)
    
    [
      profileImageView,
      randomImageButton,
      nameTextField,
      phoneNumberTextField
    ].forEach { view.addSubview($0) }
    
    profileImageView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
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
  
  @objc private func randomImageButtonTapped() {
    // 랜덤 이미지 생성 구현
  }
  
  @objc private func applyButtonTapped() {
    // 적용 버튼 구현
  }
}
