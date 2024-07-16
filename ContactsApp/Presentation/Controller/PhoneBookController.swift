//
//  PhoneBookViewController.swift
//  ContactsApp
//
//  Created by 김동현 on 7/16/24.
//

import UIKit
import SnapKit

class PhoneBookViewController: UIViewController {
  
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
  
  private func setupNavigationBar() {
    self.title = "연락처 추가"
    
    let applyButton = UIBarButtonItem(title: "적용", style: .plain, target: self, action: #selector(applyButtonTapped))
    navigationItem.rightBarButtonItem = applyButton
  }
  
  private func setupActions() {
    phoneBookView.randomImageButton.addTarget(self, action: #selector(randomImageButtonTapped), for: .touchDown)
  }
  
  @objc private func randomImageButtonTapped() {
    // 랜덤 이미지 생성 구현
  }
  
  @objc private func applyButtonTapped() {
    // 적용 버튼 구현
  }
}
