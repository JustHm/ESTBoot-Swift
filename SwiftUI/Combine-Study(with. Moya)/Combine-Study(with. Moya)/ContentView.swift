//
//  ContentView.swift
//  Combine-Study(with. Moya)
//
//  Created by 안정흠 on 2/26/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(viewModel.model.message)
                .font(.body)
                .padding()
            HStack {
                Text(viewModel.model.author)
                Divider().frame(height: 16)
                    .background(Color.black)
                Text(viewModel.model.authorProfile)
            }
            .padding()
            
            Button {
//                viewModel.getMessageFromAPI()
                viewModel.getMessageWithCombine()
            } label: {
                Text("Refresh")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
