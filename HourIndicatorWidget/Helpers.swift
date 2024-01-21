//
//  WidgetData.swift
//  MonthlyWidgetExtension
//
//  Created by Lidiomar Machado on 16/10/23.
//

import SwiftUI

struct HourIndicatorData {
    let formattedDate: String
    let emojiText: String
    
    private static func convertDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    static func widgetDataInformation(from date: Date) -> HourIndicatorData {
        let hour = Calendar.current.component(.hour, from: date)
        switch hour {
        case 0:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕛")
        case 1:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕐")
        case 2:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕑")
        case 3:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕒")
        case 4:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕓")
        case 5:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕔")
        case 6:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕕")
        case 7:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕖")
        case 8:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕗")
        case 9:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕘")
        case 10:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕙")
        case 11:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕚")
        case 12:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕛")
        case 13:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕐")
        case 14:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕑")
        case 15:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕒")
        case 16:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕓")
        case 17:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕔")
        case 18:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕕")
        case 19:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕖")
        case 20:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕗")
        case 21:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕘")
        case 22:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕙")
        case 23:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕚")
        default:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "❌")
        }
    }
    
    static func interactiveWidgetDataInformation(from date: Date) -> HourIndicatorData {
        let hour = Calendar.current.component(.hour, from: date)
        switch hour {
        case 0:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕛 🥚")
        case 1:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕐 🥚")
        case 2:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕑 🐣")
        case 3:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕒 🐣")
        case 4:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕓 🐣")
        case 5:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕔 🐥")
        case 6:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕕 🐥")
        case 7:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕖 🐥")
        case 8:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕗 🐓")
        case 9:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕘 🐓")
        case 10:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕙 🥚")
        case 11:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕚 🥚")
        case 12:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕛 🥚")
        case 13:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕐 🐣")
        case 14:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕑 🐣")
        case 15:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕒 🐣")
        case 16:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕓 🐥")
        case 17:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕔 🐥")
        case 18:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕕 🐥")
        case 19:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕖 🐓")
        case 20:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕗 🐓")
        case 21:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕘 🐓")
        case 22:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕙 🥚")
        case 23:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "🕚 🥚")
        default:
            return HourIndicatorData(formattedDate: convertDate(date: date), emojiText: "❌")
        }
    }
    
}

struct DateHelper {
    static func dateFrom(year: Int, month: Int, day: Int, hour: Int) -> Date {
        let component = DateComponents(calendar: Calendar.current, year: year, month: month, day: day, hour: hour)
        
        return Calendar.current.date(from: component)!
    }
}

struct URLHelper {
    static func widgetURLWith(emoji: String, andDate date: String) -> URL {
        let url = URL(string: "hourindicator://tap?emoji=\(emoji)&date=\(date)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        return url
    }
}

struct PreviewHelper {
    static func previewData() -> [HourIndicatorTimelineData] {
        var dataList: [HourIndicatorTimelineData] = [HourIndicatorTimelineData]()
        for i in 0...23 {
            let date = DateHelper.dateFrom(year: 2023, month: 12, day: 4, hour: i)
            let model = HourIndicatorData.widgetDataInformation(from: date)
            dataList.append(HourIndicatorTimelineData(date: date, model: model))
        }
        return dataList
    }
    
    static func interactivePreviewData() -> [HourIndicatorTimelineData] {
        var dataList: [HourIndicatorTimelineData] = [HourIndicatorTimelineData]()
        for i in 0...23 {
            let date = DateHelper.dateFrom(year: 2023, month: 12, day: 4, hour: i)
            let model = HourIndicatorData.interactiveWidgetDataInformation(from: date)
            dataList.append(HourIndicatorTimelineData(date: date, model: model))
        }
        return dataList
    }
    
    static func configurablePreviewData() -> [ConfigurableHourIndicatorTimelineData] {
        let model = HourIndicatorData.interactiveWidgetDataInformation(from: .now)
        return [ConfigurableHourIndicatorTimelineData(date: .now, model: model, color: .orange)]
    }
}
