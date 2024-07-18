//
//  FriendsListController.swift
//  ContactsApp
//
//  Created by 김동현 on 7/15/24.
//

import UIKit
import SnapKit

class FriendsListController: UIViewController, UITableViewDelegate, UITableViewDataSource, PhoneBookControllerDelegate {
  
  private var friendsListView = FriendsListView()
  private var friends: [Contact] = []
  
  override func loadView() {
    friendsListView = FriendsListView(frame: UIScreen.main.bounds)
    self.view = friendsListView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar()
    setupActions()
    setupTableView()
    fetchContacts()
  }
  
  private func setupNavigationBar() {
    self.title = "친구 목록"
    self.navigationItem.backButtonTitle = "Back"
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(addButtonTapped))
  }
  
  private func setupActions() {
    friendsListView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
  }
  
  private func setupTableView() {
    friendsListView.tableView.delegate = self
    friendsListView.tableView.dataSource = self
  }
  
  private func fetchContacts() {
    friends = CoreDataManager.shared.fetchAllContacts()
    friendsListView.tableView.reloadData()
  }
  
  @objc private func addButtonTapped() {
    // 추가 화면으로 이동
    let phoneBookViewController = PhoneBookController()
    phoneBookViewController.delegate = self
    self.navigationController?.pushViewController(phoneBookViewController, animated: true)
  }
  
  // 테이블 뷰 셀 높이 크기 지정.
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    80
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.id) as? TableViewCell else {
      return UITableViewCell()
    }
    let friend = friends[indexPath.row]
    cell.configureCell(contact: friend)
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    friends.count
  }
  
  // PhoneBookControllerDelegate 메서드
  func didSaveContact() {
    fetchContacts()
  }
}
