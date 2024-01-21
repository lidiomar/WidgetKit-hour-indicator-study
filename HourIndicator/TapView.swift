//
//  TapView.swift
//  HourIndicator
//
//  Created by Lidiomar Machado on 20/11/23.
//

import SwiftUI

struct TapView: View {
    var items: [URLQueryItem]
    private var emojiText: String = "❌"
    private var dateText: String = ""
    
    init(queryItems: [URLQueryItem]) {
        items = queryItems
        emojiText = emojiText(queryItems: items)
        dateText = description(queryItems: items)
    }
    
    private func description(queryItems: [URLQueryItem]) -> String {
        var dateText: String = ""
        queryItems.forEach { item in
            if item.name == "date" {
                dateText = "\(item.value!)"
            }
        }
        return dateText
    }
    
    private func emojiText(queryItems: [URLQueryItem]) -> String {
        var emojiText: String = "❌"
        queryItems.forEach { item in
            if item.name == "emoji" {
                emojiText = "\(item.value!)"
            }
        }
        return emojiText
    }
    
    var body: some View {
        VStack {
            Text(emojiText).font(.largeTitle)
            Text(dateText)
                .minimumScaleFactor(0.5)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.cyan)
        .foregroundColor(.white)
    }
}
