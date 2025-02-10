//
//  ArrayManageView.swift
//  SwiftUI-FirstDay
//
//  Created by 안정흠 on 2/10/25.
//

import SwiftUI

struct ArrayManageView: View {
    @State var addInput: String = ""
    @State var searchInput: String = ""
    @State var deleteInput: String = ""
    @State var arr: [String] = ["HI", "HELLO"]
    @State var message: String = ""
    @State var searchText: String = ""
    @State var isAnimation: Bool = false
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
            Text("현재 단어 수: \(arr.count)")
            List(arr, id: \.self) { item in
                Text(item)
            }
            HStack {
                TextField("Search word", text: $searchInput)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Button("Search") {
                    search()
                }
            }
            Text(searchText)
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
        guard !arr.contains(addInput) else {
            message = "이미 존재하는 단어입니다."
            return
        }
        if !addInput.isEmpty {
            withAnimation {
                arr.append(addInput)
            }
            
            message = "저장되었습니다."
            addInput = ""
        }
        else {
            message = "단어를 입력하세요"
        }
        
    }
    func search() {
        if let index = arr.firstIndex(of: searchInput) {
            searchText = "\(searchInput)은 배열의 \(index + 1)번째 위치에 있습니다."
            searchInput = ""
        }
        else {
            searchText = "찾으시는 단어가 없습니다."
        }
    }
    func delete() {
        if let index = arr.firstIndex(of: deleteInput) {
            withAnimation {
                arr.remove(at: index)
            }
            message = "\(deleteInput) 삭제되었습니다."
            deleteInput = ""
        }
        else {
            message = "존재하지 않습니다."
        }
    }
}

#Preview {
    ArrayManageView()
}
