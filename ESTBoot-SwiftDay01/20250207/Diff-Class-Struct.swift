//
//  Diff-Class-Struct.swift
//  ESTBoot-SwiftDay01
//
//  Created by 안정흠 on 2/7/25.
//

import Foundation

class Person1 {
    var name: String
    init(name: String) {
        self.name = name
    }
}

struct Animal {
    var type: String
}


protocol Product {
    func info()
}

class Car: Product {
    var brand: String
    var model: String

    init(brand: String, model: String) {
        self.brand = brand
        self.model = model
    }
    
    func info() {
        print("\(brand) \(model)")
    }
}

class Book: Product {
    var title: String
    var author: String
    
    init(title: String, author: String) {
        self.title = title
        self.author = author
    }

        // 제목과 저자를 출력
    func info() {
        print("\(title) by \(author)")
    }
}
//var list: [Product] = []
//list.append(Car(brand: "KIA", model: "---"))
//list.append(Book(title: "abc", author: "me"))
//for item in list {
//    item.info()
//}
