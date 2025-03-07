//
//  CoreDataManager.swift
//  WeeklyProject-MyContentManager
//
//  Created by 안정흠 on 3/7/25.
//

import Foundation
import CoreData

final class CoreDataManager {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ContentModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func addContent(content: Content) {
        if let entity = NSEntityDescription.entity(forEntityName: "ContentEntity", in: context) {
            let managedObject = NSManagedObject(entity: entity, insertInto: context)
            managedObject.setValue(content.id, forKey: "id")
            managedObject.setValue(content.text, forKey: "text")
            save()
        }
    }
    
    func deleteContent(id: UUID) {
        let request = ContentEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        do {
            let data = try context.fetch(request)
            
            if let data = data.first { context.delete(data) }
            save()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func updateContent(content: Content) {
        let request = ContentEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", content.id as CVarArg)
        do {
            let data = try context.fetch(request).first
            data?.setValue(content.text, forKey: "text")
            save()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchContents() -> [Content] {
        let request = ContentEntity.fetchRequest()
        do {
            let data = try context.fetch(request)
            return data.compactMap{ item -> Content? in
                guard let id = item.id,
                      let text = item.text else { return nil }
                
                return Content(id: id, text: text)
            }
        }
        catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    private func save() {
        if context.hasChanges {
            do {
                try context.save()
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
}
