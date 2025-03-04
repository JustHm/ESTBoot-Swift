//
//  DatePickerExample.swift
//  SwiftUI-FirstDay
//
//  Created by 안정흠 on 2/13/25.
//

import SwiftUI

struct DatePickerExample: View {
    @State private var selectedDate = Date()
    var body: some View {
        VStack {
            Text("선택한 날짜: \(selectedDate, formatter: dateFormatter)")
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.graphical)
        }
        
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

#Preview {
    DatePickerExample()
}
