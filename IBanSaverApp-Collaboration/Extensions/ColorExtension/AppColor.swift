//
//  AppColor.swift
//  IBanSaverApp-Collaboration
//
//  Created by Eka Kelenjeridze on 11.01.24.
//

import SwiftUI

struct AppColor {
    static let background = Color(hex: 0xFAFAFA)
    static let blue = Color(hex: 0x2567F9)
    static let lightBlue = Color(hex: 0x345AFA)
    static let red = Color(hex: 0xCB3A31)
    static let green = Color(hex: 0x43936C)
    static let darkGray = Color(hex: 0x747985)
    static let lightGray = Color(hex: 0xEEF1F5)
    static let textPrimary = Color(hex: 0x353942)
    static let textSecondary = Color(hex: 0x747985)
}
 
extension Color {
    init(hex: UInt32, alpha: Double = 1.0) {
        let red = Double((hex >> 16) & 0xFF) / 255.0
        let green = Double((hex >> 8) & 0xFF) / 255.0
        let blue = Double(hex & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}
