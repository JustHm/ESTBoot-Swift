//
//  TabViewExample.swift
//  SwiftUI-FirstDay
//
//  Created by 안정흠 on 2/12/25.
//

import SwiftUI

struct TabViewExample: View {
    var body: some View {
        TabView {
            TabHomeView().tabItem {
                Label("HOME", systemImage: "house")
            }
            
            TabNONEView().tabItem {
                Label("CLOUD", systemImage: "cloud")
            }
            
            TabSettingView().tabItem {
                Label("Setting", systemImage: "gear")
            }
        }
    }
}

#Preview {
    TabViewExample()
}
