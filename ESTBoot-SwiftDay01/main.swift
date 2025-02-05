import Foundation

print("실행할 예제 번호: ", terminator: "")
let no = Int(readLine() ?? "0")

switch no {
case 1:
    let ex = FunctionEx01()
    ex.run()
case 2:
    let ex = FunctionEx02()
    ex.run()
case 3:
    let ex = FunctionEx03()
default:
    print("NONE")
}

print(":::: 전화번호부 ::::")
var book = telephoneBook()
while true {
    print("""
    ----- Menu -----
    1)INPUT 2)OUTPUT 3)SEARCH 4)EDIT 5)DELETE 6)END
    Choice: 
    """, terminator: "")
    switch Int(readLine() ?? "0") {
    case 1:
        book.input()
    case 2:
        book.output()
    case 3:
        book.search()
    case 4:
        book.edit()
    case 5:
        book.delete()
    case 6:
        print("종료합니다.")
        exit(0)
    default:
        print("잘못된 입력입니다.")
    }
}

