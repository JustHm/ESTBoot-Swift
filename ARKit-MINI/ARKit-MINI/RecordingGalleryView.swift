//
//  RecordingGalleryView.swift
//  ARKit-MINI
//
//  Created by 안정흠 on 4/29/25.
//


import SwiftUI

struct RecordingGalleryView: View {
    @EnvironmentObject private var manager: RecordingManager
    @State private var selectedIndex: Int?
    @State private var showPlayback = false
    @State private var maxIndex: Int = 0
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(0..<maxIndex, id: \.self) { index in
                    Button(action: {
                        selectedIndex = index
                        showPlayback = true
                    }) {
                        Text("\(index)")
                    }
                }
            }
            .navigationTitle("녹화 목록")
            .onAppear {
                maxIndex = manager.recordGallery.count
            }
            .navigationDestination(isPresented: $showPlayback) {
                if let selectedIndex {
                    SimplePlaybackView(frames: manager.recordGallery[selectedIndex])
                }
                    
            }
        }
    }
}
