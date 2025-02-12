//
//  TabHomeView.swift
//  SwiftUI-FirstDay
//
//  Created by 안정흠 on 2/12/25.
//

import SwiftUI

struct TabHomeView: View {
    @State var text: String = "....."
    var body: some View {
        VStack {
            Image(systemName: "house")
                .resizable()
                .frame(width: 100, height: 100)
            Text(text)
            Button("Press!") {
                text = "HELLO"
            }
            .padding(8)
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 32))
        }
    }
}

struct TabSettingView: View {
    var body: some View {
        VStack {
            Image(systemName: "gear")
                .resizable()
                .frame(width: 100, height: 100)
            Text("Hello, World!")
        }
    }
}

struct TabNONEView: View {
    var body: some View {
        VStack {
            Image(systemName: "cloud")
                .resizable()
                .frame(width: 100, height: 100)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    TabHomeView()
}
