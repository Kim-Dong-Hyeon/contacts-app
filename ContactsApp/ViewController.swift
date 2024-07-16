//
//  ViewController.swift
//  ContactsApp
//
//  Created by 김동현 on 7/15/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
  
  private let addButton = UIButton(type: .system)
  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.id)
    return tableView
  }()
  
  // 임시 데이터
  private let friends = [
    ("가나다", "010-1111-2222"),
    ("라마바", "010-3333-4444"),
    ("사아자", "010-5555-6666"),
    ("차카타", "010-7777-8888"),
    ("파하", "010-9999-0000")
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  
  private func configureUI() {
    view.backgroundColor = .white
    
    // 네비게이션 타이틀 설정
    self.title = "친구 목록"
    
    // Back 버튼 텍스트 설정
    let backButton = UIBarButtonItem()
    backButton.title = "Back"
    navigationItem.backBarButtonItem = backButton
    
    // 추가 버튼 설정
    addButton.setTitle("추가", for: .normal)
    addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
    
    [tableView].forEach { view.addSubview($0) }
    
    tableView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide).inset(20)
    }
  }
  
  @objc private func addButtonTapped() {
    // 추가 화면으로 이동
    let phoneBookViewController = PhoneBookViewController()
    self.navigationController?.pushViewController(phoneBookViewController, animated: true)
  }
}

extension ViewController: UITableViewDelegate {
  // 테이블 뷰 셀 높이 크기 지정.
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    80
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.id) as? TableViewCell else {
      return UITableViewCell()
    }
    let friend = friends[indexPath.row]
    cell.configureCell(name: friend.0, phoneNumber: friend.1)
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    friends.count
  }
}
