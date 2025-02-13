//
//  FIleManagerExample.swift
//  SwiftUI-FirstDay
//
//  Created by 안정흠 on 2/13/25.
//

import SwiftUI

struct FIleManagerExample: View {
    @State private var users: [User] = []

    var body: some View {
        VStack {
            List(users, id: \.id) { user in
                VStack(alignment: .leading) {
                    Text("이름: \(user.name)")
                    Text("나이: \(user.age)")
                }
            }

            Button(action: saveSampleUsers) {
                Text("샘플 데이터 저장")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Button(action: loadSavedUsers) {
                Text("저장된 데이터 불러오기")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }

    func saveSampleUsers() {
        let sampleUsers = [
            User(id: UUID(), name: "김범준", age: 25),
            User(id: UUID(), name: "장범준", age: 30)
        ]
        FileManagerHelper.shared.saveUsers(sampleUsers)
    }

    func loadSavedUsers() {
        users = FileManagerHelper.shared.loadUsers()
    }
}

#Preview {
    FIleManagerExample()
}
