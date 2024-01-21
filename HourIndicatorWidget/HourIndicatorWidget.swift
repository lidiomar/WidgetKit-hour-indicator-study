//
//  HourIndicatorWidget.swift
//  HourIndicatorWidget
//
//  Created by Lidiomar Machado on 17/11/23.
//

import WidgetKit
import SwiftUI

/* - MARK: HourIndicatorTimelineData */
struct HourIndicatorTimelineData: TimelineEntry {
    let date: Date
    let model: HourIndicatorData
}

/* - MARK: HourIndicatorTimelineData */
struct ConfigurableHourIndicatorTimelineData: TimelineEntry {
    let date: Date
    let model: HourIndicatorData
    let color: WidgetColor
}


/* - MARK: Provider */
struct Provider: TimelineProvider {
    let date: Date = .now
    let model = HourIndicatorData.widgetDataInformation(from: .now)
    
    func placeholder(in context: Context) -> HourIndicatorTimelineData {
        HourIndicatorTimelineData(date: date, model: model)
    }

    func getSnapshot(in context: Context, completion: @escaping (HourIndicatorTimelineData) -> ()) {
        let entry = HourIndicatorTimelineData(date: date, model: model)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [HourIndicatorTimelineData] = []

        let currentDate = Date()
        for hourOffset in 0 ..< 24 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let model = HourIndicatorData.widgetDataInformation(from: entryDate)
            let entry = HourIndicatorTimelineData(date: entryDate, model: model)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

/* - MARK: InteractiveProvider */
struct InteractiveProvider: TimelineProvider {
    let date: Date = .now
    let model = HourIndicatorData.widgetDataInformation(from: .now)
    
    func placeholder(in context: Context) -> HourIndicatorTimelineData {
        HourIndicatorTimelineData(date: date, model: model)
    }

    func getSnapshot(in context: Context, completion: @escaping (HourIndicatorTimelineData) -> ()) {
        let entry = HourIndicatorTimelineData(date: date, model: model)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let currentDate = HourIndicatorDateStorage.currentDate()
        let model = HourIndicatorData.interactiveWidgetDataInformation(from: currentDate)
        let timeline = Timeline(entries: [HourIndicatorTimelineData(date: date, model: model)], policy: .atEnd)
        completion(timeline)
    }
}

/* - MARK: AppIntentTimelineProvider */
struct ConfigurableAppIntentTimelineProvider: AppIntentTimelineProvider {
    let date: Date = .now
    let model = HourIndicatorData.widgetDataInformation(from: .now)
    
    func placeholder(in context: Context) -> ConfigurableHourIndicatorTimelineData {
        ConfigurableHourIndicatorTimelineData(date: date, model: model, color: .orange)
    }

    func snapshot(for configuration: SelectColorIntent, in context: Context) async -> ConfigurableHourIndicatorTimelineData {
        ConfigurableHourIndicatorTimelineData(date: date, model: model, color: .orange)
    }
    
    func timeline(for configuration: SelectColorIntent, in context: Context) async -> Timeline<Entry> {
        let currentDate = HourIndicatorDateStorage.currentDate()
        let model = HourIndicatorData.interactiveWidgetDataInformation(from: currentDate)
        return Timeline(entries: [ConfigurableHourIndicatorTimelineData(date: date, model: model, color: configuration.widgetColor)], policy: .atEnd)
    }
}

/* - MARK: Widgets */
struct ConfigurableHourIndicatorWidget: Widget {
    let kind: String = "ConfigurableHourIndicatorWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind,
                               intent: SelectColorIntent.self,
                               provider: ConfigurableAppIntentTimelineProvider()) { entry in
            ConfigurableHourIndicatorWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Configurable Widget")
        .description("This is an example of Configurable widget.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge, .accessoryCircular, .accessoryInline])
    }
}

struct InteractiveHourIndicatorWidget: Widget {
    let kind: String = "InteractiveHourIndicatorWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: InteractiveProvider()) { entry in
            InteractiveHourIndicatorWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Interactive Widget")
        .description("This is an example of Interactive widget.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge, .accessoryCircular, .accessoryInline])
    }
}

struct HourIndicatorWidget: Widget {
    let kind: String = "HourIndicatorWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            HourIndicatorWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge, .accessoryCircular, .accessoryInline])
    }
}

/* - MARK: ConfigurableHourIndicatorWidgetEntryView */
struct ConfigurableHourIndicatorWidgetEntryView : View {
    @Environment(\.widgetFamily) var family
    var entry: ConfigurableAppIntentTimelineProvider.Entry
    
    init(entry: ConfigurableAppIntentTimelineProvider.Entry) {
        self.entry = entry
    }
    
    func getColor(color: WidgetColor) -> Color {
        switch color {
        case .orange:
            return .orange
        case .blue:
            return .blue
        case .yellow:
            return .yellow
        case .green:
            return .green
        case .red:
            return .red
        }
    }
        
    var body: some View {
        HStack {
            switch family {
            case .systemSmall, .systemMedium, .systemLarge:
                VStack {
                    Spacer()
                    Text("\(entry.model.emojiText)").font(.system(size: 50))
                    Spacer()
                    Text("\(entry.model.formattedDate)").fontWeight(.bold)
                    Spacer()
                }
            case .accessoryRectangular:
                HStack {
                    Spacer()
                    Text("\(entry.model.emojiText)").font(.largeTitle)
                    Spacer()
                    Text("\(entry.model.formattedDate)").fontWeight(.bold)
                    Spacer()
                }
            case .accessoryInline:
                VStack {
                    Spacer()
                    Text("\(entry.model.formattedDate)").fontWeight(.bold)
                    Spacer()
                }
            case .accessoryCircular:
                VStack {
                    Spacer()
                    Text("\(entry.model.emojiText)").font(.largeTitle)
                    Spacer()
                }
            default:
                VStack {
                    Spacer()
                    Text("\(entry.model.emojiText)").font(.largeTitle)
                    Spacer()
                }
            }
        }.containerBackground(for: .widget) {
            let color = getColor(color: entry.color)
            color
        }.foregroundColor(.white)
            .widgetURL(URLHelper.widgetURLWith(emoji: entry.model.emojiText,
                                               andDate: entry.model.formattedDate))
    }
}

/* - MARK: HourIndicatorWidgetEntryView */
struct HourIndicatorWidgetEntryView : View {
    @Environment(\.widgetFamily) var family
    var entry: Provider.Entry
    
    init(entry: Provider.Entry) {
        self.entry = entry
    }
        
    var body: some View {
        HStack {
            switch family {
            case .systemSmall, .systemMedium, .systemLarge:
                VStack {
                    Spacer()
                    Text("\(entry.model.emojiText)").font(.system(size: 72))
                    Spacer()
                    Text("\(entry.model.formattedDate)").fontWeight(.bold)
                    Spacer()
                }
            case .accessoryRectangular:
                HStack {
                    Spacer()
                    Text("\(entry.model.emojiText)").font(.largeTitle)
                    Spacer()
                    Text("\(entry.model.formattedDate)").fontWeight(.bold)
                    Spacer()
                }
            case .accessoryInline:
                VStack {
                    Spacer()
                    Text("\(entry.model.formattedDate)").fontWeight(.bold)
                    Spacer()
                }
            case .accessoryCircular:
                VStack {
                    Spacer()
                    Text("\(entry.model.emojiText)").font(.largeTitle)
                    Spacer()
                }
            default:
                VStack {
                    Spacer()
                    Text("\(entry.model.emojiText)").font(.largeTitle)
                    Spacer()
                }
            }
        }.containerBackground(for: .widget) {
            Color.cyan
        }.foregroundColor(.white)
            .widgetURL(URLHelper.widgetURLWith(emoji: entry.model.emojiText,
                                               andDate: entry.model.formattedDate))
    }
}

/* - MARK: InteractiveHourIndicatorWidgetEntryView */
struct InteractiveHourIndicatorWidgetEntryView : View {
    @Environment(\.widgetFamily) var family
    var entry: InteractiveProvider.Entry
    
    init(entry: InteractiveProvider.Entry) {
        self.entry = entry
    }
        
    var body: some View {
        HStack {
            switch family {
            case .systemSmall, .systemMedium, .systemLarge:
                VStack {
                    Spacer()
                    Text("\(entry.model.emojiText)")
                        .font(.system(size: 72))
                        .contentTransition(.opacity)
                    Spacer()
                    Button(intent: HourIndicatorIntent()) {
                        Text("Tap").font(.system(size: 12))
                    }
                    Spacer()
                }
            case .accessoryRectangular:
                HStack {
                    Spacer()
                    Text("\(entry.model.emojiText)").font(.largeTitle)
                    Spacer()
                }
            case .accessoryInline:
                VStack {
                    Spacer()
                    Text("\(entry.model.formattedDate)").fontWeight(.bold)
                    Spacer()
                }
            case .accessoryCircular:
                VStack {
                    Spacer()
                    Text("\(entry.model.emojiText)").font(.largeTitle)
                    Spacer()
                }
            default:
                VStack {
                    Spacer()
                    Text("\(entry.model.emojiText)").font(.largeTitle)
                    Spacer()
                }
            }
        }.containerBackground(for: .widget) {
            Color.cyan
        }.foregroundColor(.white)
            .widgetURL(URLHelper.widgetURLWith(emoji: entry.model.emojiText,
                                               andDate: entry.model.formattedDate))
    }
}

/* - MARK: Preview */
#Preview(as: .systemSmall) {
    ConfigurableHourIndicatorWidget()
} timeline: {
    return PreviewHelper.configurablePreviewData()
}
