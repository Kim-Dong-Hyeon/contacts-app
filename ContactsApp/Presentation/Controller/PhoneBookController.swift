//
//  PhoneBookController.swift
//  ContactsApp
//
//  Created by 김동현 on 7/16/24.
//

import UIKit
import SnapKit

class PhoneBookController: UIViewController {
  
  private var phoneBookView = PhoneBookView()
  
  override func loadView() {
    phoneBookView = PhoneBookView(frame: UIScreen.main.bounds)
    view = phoneBookView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar()
    setupActions()
  }
  
  /// 네비게이션 바 설정 함수
  private func setupNavigationBar() {
    self.title = "연락처 추가"
    
    let applyButton = UIBarButtonItem(title: "적용", style: .plain, target: self, action: #selector(applyButtonTapped))
    navigationItem.rightBarButtonItem = applyButton
  }
  
  /// 버튼 액션 설정 함수
  private func setupActions() {
    phoneBookView.randomImageButton.addTarget(self, action: #selector(randomImageButtonTapped), for: .touchDown)
  }
  
  /// 랜덤 이미지 버튼 액션 설정 함수
  @objc private func randomImageButtonTapped() {
    // 랜덤 이미지 생성 구현
    let randomNumber = Int.random(in: 1...1000)
    NetworkManager.shared.fetchPokemonImage(id: randomNumber) { [weak self] url in
      guard let self = self else { return }
      DispatchQueue.main.async {
        if let url = url {
          self.phoneBookView.profileImageView.load(url: url)
        }
      }
    }
  }
  
  /// 적용 버튼 액션 설정 함수
  @objc private func applyButtonTapped() {
    // 적용 버튼 구현
  }
}
