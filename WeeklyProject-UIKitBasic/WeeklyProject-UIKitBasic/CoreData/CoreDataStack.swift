//
//  CoreDataStack.swift
//  WeeklyProject-UIKitBasic
//
//  Created by 안정흠 on 2/28/25.
//


import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ReviewCoreData")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    func addReview(_ data: Review) {
        let entity = NSEntityDescription.entity(forEntityName: "ReviewEntity", in: self.context)
        if let entity {
            let managedObject = NSManagedObject(entity: entity, insertInto: self.context)
            managedObject.setValue(data.id, forKey: "id")
            managedObject.setValue(data.movieID, forKey: "movieID")
            managedObject.setValue(data.username, forKey: "username")
            managedObject.setValue(data.comment, forKey: "comment")
            managedObject.setValue(data.rating, forKey: "rating")
            saveContext()
        }
    }
    func deleteReview(_ data: Review) {
        let entity = NSEntityDescription.entity(forEntityName: "ReviewEntity", in: self.context)
        if let entity {
            let managedObject = NSManagedObject(entity: entity, insertInto: self.context)
            managedObject.setValue(data.id, forKey: "id")
            managedObject.setValue(data.movieID, forKey: "movieID")
            managedObject.setValue(data.username, forKey: "username")
            managedObject.setValue(data.comment, forKey: "comment")
            managedObject.setValue(data.rating, forKey: "rating")
            context.delete(managedObject)
            saveContext()
        }
    }
    func fetchFromReviewByMovieID(_ id: String) -> [ReviewEntity] {
        let request: NSFetchRequest<ReviewEntity> = ReviewEntity.fetchRequest()
        request.predicate = NSPredicate(format: "movieID == %@", id)
        do {
            let fetchResult = try self.context.fetch(request)
            return fetchResult
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
