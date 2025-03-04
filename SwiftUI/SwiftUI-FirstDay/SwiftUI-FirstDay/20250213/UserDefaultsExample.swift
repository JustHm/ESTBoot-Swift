//
//  UserDefaultsExample.swift
//  SwiftUI-FirstDay
//
//  Created by 안정흠 on 2/13/25.
//

import SwiftUI

struct UserDefaultsExample: View {
    @AppStorage("userName") private var userName: String = "Guest"
//    @State private var userName: String = ""
    @State private var userAge: String = ""
    @State private var appTheme: Bool = false
    var body: some View {
        NavigationView {
            Form {
                Section("앱 설정") {
                    TextField("이름", text: $userName)
                    TextField("나이", text: $userAge)
                }
                Section("다크모드 설정") {
                    Toggle("다크모드 설정", isOn: $appTheme)
                }
                Section("버튼 그룹") {
                    Button("데이터 저장") {
                        saveData()
                    }
                    Button("데이터 불러오기") {
                        loadData()
                    }
                }
            }
        }
    }
}

extension UserDefaultsExample {
    //MARK: 저장 기능
    private func saveData() {
//        UserDefaults.standard.set(userName, forKey: "userName")
        UserDefaults.standard.set(userAge, forKey: "userAge")
        UserDefaults.standard.set(appTheme, forKey: "appTheme")
    }
    //MARK: 불러오기 기능
    private func loadData() {
//        userName = UserDefaults.standard.string(forKey: "userName") ?? "Unknown"
        let age = UserDefaults.standard.integer(forKey: "userAge")
        userAge = String(age)
        appTheme = UserDefaults.standard.bool(forKey: "isDarkMode")
        
    }
}

#Preview {
    UserDefaultsExample()
}
