//
//  StateObjectExample.swift
//  SwiftUI-FirstDay
//
//  Created by 안정흠 on 2/12/25.
//

import SwiftUI

struct ParentView: View {
    @StateObject var settings = UserSettings()
    var body: some View {
        ChildView().environmentObject(settings)
    }
}
struct ChildView: View {
    @EnvironmentObject var settings: UserSettings
    var body: some View {
        Text("Hello \(settings.username)")
    }
}
struct StateObjectExample: View {
    @StateObject var settings = UserSettings()
    var body: some View {
        ParentView()
    }
}

#Preview {
    StateObjectExample()
}

class UserSettings: ObservableObject {
    @Published var username: String = "Guest"
}

