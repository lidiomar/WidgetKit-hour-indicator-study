//
//  SelectColorIntent.swift
//  HourIndicatorWidgetExtension
//
//  Created by Lidiomar Machado on 22/11/23.
//

import Foundation
import AppIntents

// https://developer.apple.com/documentation/widgetkit/making-a-configurable-widget

struct SelectColorIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Select color"
    
    @Parameter(title: "Widget Color")
    var widgetColor: WidgetColor
}

enum WidgetColor: String, AppEnum {
    case orange = "orange"
    case blue = "blue"
    case yellow = "yellow"
    case green = "green"
    case red = "red"
    
    typealias RawValue = String
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Color"
    
    static var caseDisplayRepresentations: [WidgetColor : DisplayRepresentation] = [
        .orange: .init(stringLiteral: "🟠 Orange"),
        .blue: .init(stringLiteral: "🔵 Blue"),
        .yellow: .init(stringLiteral: "🟡 Yellow"),
        .green: .init(stringLiteral: " 🟢 Green"),
        .red: .init(stringLiteral: "🔴 Red")
    ]
    
    static var allCases: [WidgetColor] = [.orange, .blue, .yellow, .green, .red]
}
