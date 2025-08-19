//
//  File.swift
//  
//
//  Created by Ehsan Mousavi on 8/17/25.
//

import SwiftUI

@available(macOS 10.15, *)
public struct Theme : Identifiable, Hashable {
    public let id : UUID
    public var name : String
    public var mainColor : Color
    public var accentColor : Color
    public var textColor : Color
    
    public init(
        id: UUID = UUID(),
        name: String,
        mainColor: Color,
        accentColor: Color,
        textColor : Color = .primary
    ) {
        self.id = id
        self.name = name
        self.mainColor = mainColor
        self.accentColor = accentColor
        self.textColor = textColor
    }
}
