//
//  ContentView.swift
//  SwiftUI-FirstDay
//
//  Created by 안정흠 on 2/10/25.
//

import SwiftUI

struct ContentView: View {
    @State var addInput: String = ""
    @State var deleteInput: String = ""
    @State var arr: [String] = ["HI", "HELLO"]
    @State var message: String = ""
    var body: some View {
        VStack {
            Text("Array 관리 프로그램")
                .font(.largeTitle)
                .padding()
            HStack {
                TextField("Input add item", text: $addInput)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Button("Add") {
                    add()
                }
            }
            
            List(arr, id: \.self) { item in
                Text(item)
            }
            
            HStack {
                TextField("Input delete item", text: $deleteInput)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Button("Delete") {
                    delete()
                }
            }
            Text(message)
        }
        .padding(8)
    }
    
    func add() {
        if !addInput.isEmpty {
            arr.append(addInput)
            message = "저장되었습니다."
            addInput = ""
        }
        else {
            message = "단어를 입력하세요"
        }
        
    }
    func delete() {
        if let index = arr.firstIndex(of: deleteInput) {
            arr.remove(at: index)
            message = "\(deleteInput) 삭제되었습니다."
            deleteInput = ""
        }
        else {
            message = "존재하지 않습니다."
        }
    }
}

#Preview {
    ContentView()
}
