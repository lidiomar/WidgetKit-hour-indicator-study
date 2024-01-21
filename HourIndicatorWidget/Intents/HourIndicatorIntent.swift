//
//  HourIndicatorIntent.swift
//  HourIndicator
//
//  Created by Lidiomar Machado on 20/11/23.
//

import AppIntents

struct HourIndicatorIntent: AppIntent {
    static var title: LocalizedStringResource = "HourIndicatorIntent"
    
    func perform() async throws -> some IntentResult {
        HourIndicatorDateStorage.incrementDate()
        return .result()
    }
    
}

struct HourIndicatorDateStorage {
    private static let sharedDefaults: UserDefaults = UserDefaults(suiteName: "group.hourindicator")!
    private static let key = "hourIndicatorDate"
    
    static func incrementDate() {
        if let date = sharedDefaults.value(forKey: key) as? Date {
            let incrementedDate = Calendar.current.date(byAdding: .hour, value: 1, to: date)
            sharedDefaults.setValue(incrementedDate, forKey: key)
        } else {
            sharedDefaults.setValue(Date.now, forKey: key)
        }
    }
    
    static func currentDate() -> Date {
        return sharedDefaults.value(forKey: key) as? Date ?? Date.now
    }
}
