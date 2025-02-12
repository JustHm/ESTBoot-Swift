//
//  ObservedObjectExample.swift
//  SwiftUI-FirstDay
//
//  Created by 안정흠 on 2/12/25.
//

import SwiftUI

struct ObservedObjectExample: View {
    @ObservedObject var cntObj: CntClass = CntClass()
    var body: some View {
        VStack(spacing: 8) {
            Text("Count: \(cntObj.count)")
            HStack {
                Button("증가") {
                    cntObj.count += 1
                }
                Button("감소") {
                    cntObj.count += 1
                }
            }
            
        }
    }
}

#Preview {
    ObservedObjectExample()
}

class CntClass: ObservableObject {
    @Published var count = 0
    init(count: Int = 0) {
        self.count = count
    }
}
