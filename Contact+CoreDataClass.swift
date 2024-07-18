//
//  Contact+CoreDataClass.swift
//  ContactsApp
//
//  Created by 김동현 on 7/18/24.
//
//

import Foundation
import CoreData

@objc(Contact)
public class Contact: NSManagedObject {
  public static let className = "Contact"
  public enum Key {
    static let id = "id"
    static let name = "name"
    static let phoneNumber = "phoneNumber"
    static let profileImageId = "profileImageId"
  }
}
