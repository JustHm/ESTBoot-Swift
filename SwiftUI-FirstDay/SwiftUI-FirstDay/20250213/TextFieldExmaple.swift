//
//  TextFieldExmaple.swift
//  JSONDecodeTest
//
//  Created by 안정흠 on 2/13/25.
//

import SwiftUI

struct TextFieldExmaple: View {
    @State private var name: String = ""
    @State private var email: String = ""
    var body: some View {
        VStack {
            HStack {
                Text("이름을 입력하세요")
                TextField("이름",text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()
            HStack {
                Text("이메일 입력하세요")
                TextField("이메일",text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                //(키보드 타입별 리스트)https://velog.io/@oasis444/iOS-Keyboard-Types-in-iOS
                    .keyboardType(.emailAddress)
            }.padding()
            
            
            Text("입력된 이름: \(name)")
            Text("입력된 이메일: \(email)")
        }
        .background(.gray)
    }
}

#Preview {
    TextFieldExmaple()
}
