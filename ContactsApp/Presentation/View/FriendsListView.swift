//
//  FriendsListView.swift
//  ContactsApp
//
//  Created by 김동현 on 7/17/24.
//

import UIKit
import SnapKit

class FriendsListView: UIView {
  
  let addButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("추가", for: .normal)
    return button
  }()
   let tableView: UITableView = {
    let tableView = UITableView()
    tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.id)
    return tableView
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
    
    [tableView].forEach { self.addSubview($0) }
    
    tableView.snp.makeConstraints {
      $0.edges.equalTo(self.safeAreaLayoutGuide).inset(20)
    }
  }
}
