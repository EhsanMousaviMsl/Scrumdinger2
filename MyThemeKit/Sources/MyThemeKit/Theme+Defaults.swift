//
//  File.swift
//  
//
//  Created by Ehsan Mousavi on 8/17/25.
//

import SwiftUI

@available(macOS 10.15, *)

public extension Theme {
    static let bubblegum = Theme(name: "Bubblegum", mainColor: .pink, accentColor: .white)
    static let sky = Theme(name: "Sky", mainColor: .blue, accentColor: .white)
    static let orange = Theme(name: "Orange", mainColor: .orange, accentColor: .white)
    static let lavender = Theme(name: "Lavender", mainColor: .purple, accentColor: .white)
    @available(macOS 12.0, *)
    static let green = Theme(name: "green", mainColor: .green, accentColor: .white)
    @available(macOS 12.0, *)
    static let all: [Theme] = [.bubblegum, .sky, .orange, .lavender, .green]
}
