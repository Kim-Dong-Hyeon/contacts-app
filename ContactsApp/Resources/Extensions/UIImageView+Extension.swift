//
//  UIImageView+Extension.swift
//  ContactsApp
//
//  Created by 김동현 on 7/17/24.
//

import UIKit

// URL을 사용하여 이미지를 로드할 수 있도록 UIImageView 확장
extension UIImageView {
  func load(url: URL) {
    DispatchQueue.global().async { [weak self] in
      if let data = try? Data(contentsOf: url) {
        if let image = UIImage(data: data) {
          DispatchQueue.main.async {
            self?.image = image
          }
        }
      }
    }
  }
}
