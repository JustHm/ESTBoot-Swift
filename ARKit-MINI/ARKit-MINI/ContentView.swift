//
//  ContentView.swift
//  ARKit-MINI
//
//  Created by 안정흠 on 4/28/25.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @StateObject private var manager = RecordingManager()
    @State private var showGallery = false
    
    var body: some View {
        ZStack {
            ARBodyTrackingView(recordingManager: manager)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Button(action: {
                    manager.isRecording.toggle()
                }) {
                    Text(manager.isRecording ? "Stop Recording" : "Start Recording")
                        .padding()
                        .background(manager.isRecording ? Color.red : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
                Button {
                    showGallery.toggle()
                } label: {
                    Text("Gallery")
                }

            }
        }
        .sheet(isPresented: $showGallery) {
            RecordingGalleryView()
                .environmentObject(manager)
        }
    }
}

#Preview {
    ContentView()
}
