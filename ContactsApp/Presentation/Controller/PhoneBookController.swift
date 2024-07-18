//
//  PhoneBookController.swift
//  ContactsApp
//
//  Created by 김동현 on 7/16/24.
//

import UIKit
import SnapKit

protocol PhoneBookControllerDelegate: AnyObject {
  func didSaveContact()
}

class PhoneBookController: UIViewController {
  
  weak var delegate: PhoneBookControllerDelegate?
  
  private var phoneBookView = PhoneBookView()
  
  // 편집할 연락처를 저장할 프로퍼티
  var contact: Contact?
  private var currentProfileImageId: Int16?
  
  override func loadView() {
    phoneBookView = PhoneBookView(frame: UIScreen.main.bounds)
    view = phoneBookView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar()
    setupActions()
    configureViewWithContact()
  }
  
  /// 네비게이션 바 설정 함수
  private func setupNavigationBar() {
    self.title = contact?.name ?? "연락처 추가"
    let applyButton = UIBarButtonItem(title: "적용", style: .plain, target: self, action: #selector(applyButtonTapped))
    navigationItem.rightBarButtonItem = applyButton
  }
  
  /// 버튼 액션 설정 함수
  private func setupActions() {
    phoneBookView.randomImageButton.addTarget(self, action: #selector(randomImageButtonTapped), for: .touchDown)
  }
  
  private func configureViewWithContact() {
    if let contact = contact {
      phoneBookView.nameTextField.text = contact.name
      phoneBookView.phoneNumberTextField.text = contact.phoneNumber
      currentProfileImageId = contact.profileImageId
      if contact.profileImageId != 0 {
        NetworkManager.shared.fetchPokemonImage(id: Int(contact.profileImageId)) { [weak self] url in
          guard let self = self else { return }
          DispatchQueue.main.async {
            if let url = url {
              self.phoneBookView.profileImageView.load(url: url)
              self.phoneBookView.profileImageView.tag = Int(contact.profileImageId) // 이미지 ID 저장
            }
          }
        }
      }
    }
  }
  
  /// 랜덤 이미지 버튼 액션 설정 함수
  @objc private func randomImageButtonTapped() {
    // 랜덤 이미지 생성 구현
    let randomNumber = Int.random(in: 1...1000)
//    profileImageId = Int16(randomNumber)
    NetworkManager.shared.fetchPokemonImage(id: randomNumber) { [weak self] url in
      guard let self = self else { return }
      DispatchQueue.main.async {
        if let url = url {
          self.phoneBookView.profileImageView.load(url: url)
          self.phoneBookView.profileImageView.tag = randomNumber // 이미지 ID 저장
        }
      }
    }
  }
  
  /// 이름 입력값을 검증하는 함수
  private func validateName(_ name: String) -> Bool {
    return !name.isEmpty
  }
  
  /// 전화번호 입력값을 검증하는 함수
  private func validatePhoneNumber(_ phoneNumber: String) -> Bool {
    let phoneNumberRegex = "^\\d{3}-\\d{4}-\\d{4}$"
    let phoneNumberTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
    return phoneNumberTest.evaluate(with: phoneNumber)
  }
  
  /// 에러를 알리는 Alert를 띄우는 함수
  private func showAlert(message: String) {
    let alert = UIAlertController(title: "입력 오류", message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "확인", style: .default))
    present(alert, animated: true)
  }
  
  /// 적용 버튼 액션 설정 함수
  @objc private func applyButtonTapped() {
    // 적용 버튼 구현
    guard let name = phoneBookView.nameTextField.text,
          let phoneNumber = phoneBookView.phoneNumberTextField.text else {
      return
    }
    
    // 입력이 비어 있을 때의 처리
    if !validateName(name) && !validatePhoneNumber(phoneNumber) {
      showAlert(message: "\n정보를 입력해주세요.")
      return
    }
    
    if !validateName(name) {
      showAlert(message: "\n이름을 입력해주세요.")
      return
    }
    
    if !validatePhoneNumber(phoneNumber) {
      showAlert(message: "\n올바른 전화번호 형식으로 입력해주세요.\n예시: 010-1234-5678")
      return
    }
    
    let profileImageId = phoneBookView.profileImageView.tag != 0 ? Int16(phoneBookView.profileImageView.tag) : currentProfileImageId ?? 0
    
    if let contact = contact {
      // 기존 연락처 업데이트
      CoreDataManager.shared.updateContact(id: contact.id ?? "", newName: name, newPhoneNumber: phoneNumber, newProfileImageId: profileImageId)
    } else {
      CoreDataManager.shared.createContact(name: name, phoneNumber: phoneNumber, profileImageId: profileImageId)
    }
    
    delegate?.didSaveContact()
    navigationController?.popViewController(animated: true)
  }
}
