//
//  ContentView.swift
//  HourIndicator
//
//  Created by Lidiomar Machado on 17/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isTapViewActive: Bool = false
    @State private var queryItems: [URLQueryItem] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }.navigationDestination(isPresented: $isTapViewActive) {
                TapView(queryItems: queryItems)
            }
            .padding()
            .onOpenURL { url in
                let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
                if let items = urlComponents?.queryItems {
                    queryItems = items
                    isTapViewActive = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
