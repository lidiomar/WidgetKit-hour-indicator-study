//
//  HourIndicatorWidgetBundle.swift
//  HourIndicatorWidget
//
//  Created by Lidiomar Machado on 17/11/23.
//

import WidgetKit
import SwiftUI

@main
struct HourIndicatorWidgetBundle: WidgetBundle {
    var body: some Widget {
        HourIndicatorWidget()
        InteractiveHourIndicatorWidget()
        ConfigurableHourIndicatorWidget()
    }
}
