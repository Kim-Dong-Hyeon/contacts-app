//
//  Contact+CoreDataProperties.swift
//  ContactsApp
//
//  Created by 김동현 on 7/18/24.
//
//

import Foundation
import CoreData


extension Contact {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
    return NSFetchRequest<Contact>(entityName: Contact.className)
  }
  
  @NSManaged public var name: String?
  @NSManaged public var phoneNumber: String?
  @NSManaged public var id: String?
  @NSManaged public var profileImageId: Int16
  
}

extension Contact : Identifiable {
  
}
