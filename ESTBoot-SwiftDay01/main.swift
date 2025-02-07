import Foundation



var list: [Product] = []
list.append(Car(brand: "KIA", model: "---"))
list.append(Book(title: "abc", author: "me"))
for item in list {
    item.info()
}
