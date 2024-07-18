//
//  TableViewCell.swift
//  ContactsApp
//
//  Created by 김동현 on 7/15/24.
//

import UIKit
import SnapKit

final class TableViewCell: UITableViewCell {
  
  static let id = "TableViewCell"
  
  private let profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.layer.cornerRadius = 30
    imageView.layer.borderColor = UIColor.gray.cgColor
    imageView.layer.borderWidth = 2
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  private let nameLabel: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 16)
    label.textColor = UIColor { tc in
      switch tc.userInterfaceStyle {
      case .dark:
        return UIColor.lightGray
      default:
        return UIColor.darkGray
      }
    }
    return label
  }()
  private let phoneNumberLabel: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 16)
    label.textColor = UIColor { tc in
      switch tc.userInterfaceStyle {
      case .dark:
        return UIColor.lightGray
      default:
        return UIColor.darkGray
      }
    }
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureUI() {
    [
      profileImageView,
      nameLabel,
      phoneNumberLabel
    ].forEach { self.addSubview($0) }
    
    profileImageView.snp.makeConstraints {
      $0.width.height.equalTo(60)
      $0.leading.equalToSuperview().offset(20)
      $0.centerY.equalToSuperview()
    }
    
    nameLabel.snp.makeConstraints {
      $0.leading.equalTo(profileImageView.snp.trailing).offset(20)
      $0.centerY.equalToSuperview()
    }
    
    phoneNumberLabel.snp.makeConstraints {
      $0.trailing.equalToSuperview().offset(-20)
      $0.centerY.equalToSuperview()
    }
  }
  
  public func configureCell(contact: Contact) {
    nameLabel.text = contact.name
    phoneNumberLabel.text = contact.phoneNumber
    profileImageView.image = nil // 기존 이미지 초기화
    if contact.profileImageId != 0 {
      NetworkManager.shared.fetchPokemonImage(id: Int(contact.profileImageId)) { [weak self] url in
        guard let self = self else { return }
        DispatchQueue.main.async {
          if let url = url {
            self.profileImageView.load(url: url)
          }
        }
      }
    }
  }
}
