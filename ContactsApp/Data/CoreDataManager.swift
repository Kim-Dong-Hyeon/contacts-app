//
//  CoreDataManager.swift
//  ContactsApp
//
//  Created by 김동현 on 7/18/24.
//

import Foundation
import CoreData

class CoreDataManager {
  static let shared = CoreDataManager()
  
  private let persistentContainer: NSPersistentContainer
  
  private init() {
    persistentContainer = NSPersistentContainer(name: "ContactsApp")
    persistentContainer.loadPersistentStores { (description, error) in
      if let error = error {
        fatalError("Unable to load persistent stores: \(error)")
      }
    }
  }
  
  var context: NSManagedObjectContext {
    return persistentContainer.viewContext
  }
  
  // Create
  func createContact(name: String, phoneNumber: String) {
    let contact = Contact(context: context)
    contact.name = name
    contact.phoneNumber = phoneNumber
    saveContext()
  }
  
  // Read All
  func fetchAllContacts() -> [Contact] {
    let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
    do {
      return try context.fetch(fetchRequest)
    } catch {
      print("Failed to fetch contacts: \(error)")
      return []
    }
  }
  
  // Update
  func updateContact(currentName: String, newName: String) {
    let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
    fetchRequest.predicate = NSPredicate(format: "name == %@", currentName)
    do {
      let contacts = try context.fetch(fetchRequest)
      for contact in contacts {
        contact.name = newName
      }
      saveContext()
    } catch {
      print("Failed to update contact: \(error)")
    }
  }
  
  // Delete
  func deleteContact(name: String) {
    let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
    fetchRequest.predicate = NSPredicate(format: "name == %@", name)
    do {
      let contacts = try context.fetch(fetchRequest)
      for contact in contacts {
        context.delete(contact)
      }
      saveContext()
    } catch {
      print("Failed to delete contact: \(error)")
    }
  }
  
  // Save
  private func saveContext() {
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        print("Failed to save context: \(error)")
      }
    }
  }
}
