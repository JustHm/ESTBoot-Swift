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
        let request: NSFetchRequest<ReviewEntity> = ReviewEntity.fetchRequest()
        // UUID로 그대로 저장했기에 UUID로 비교해야하지만 NSPredicate에 넣을땐 무조건 String이여야한다 (값이)
        // 하지만 저장을 UUID로 했는데? - 그럼 그 데이터에 as CVarArg를 붙여주면 된다.
        // CVarArg는 Swift에서 C 스타일의 가변 인자(Variadic Arguments)로 전달할 수 있는 타입. 특히 NSPredicate에서 UUID와 같은 Swift 타입을 올바르게 전달할 때 사용.
        request.predicate = NSPredicate(format: "id == %@", data.id as CVarArg)
            do {
                let results = try context.fetch(request)
                if let objectToDelete = results.first {
                    context.delete(objectToDelete)
                    saveContext()
                } else {
                    print("삭제할 객체가 존재하지 않음")
                }
            } catch {
                print("\(error.localizedDescription)")
            }
            saveContext()
    }
    func fetchFromReviewByMovieID(_ movieID: String) -> [ReviewEntity] {
        let request: NSFetchRequest<ReviewEntity> = ReviewEntity.fetchRequest()
        request.predicate = NSPredicate(format: "movieID == %@", movieID)
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
