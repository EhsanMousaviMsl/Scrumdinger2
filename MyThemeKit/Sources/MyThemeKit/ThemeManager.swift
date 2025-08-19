//
//  File.swift
//  
//
//  Created by Ehsan Mousavi on 8/17/25.
//

import SwiftUI
import Combine

@available(macOS 10.15, *)
public final class ThemeManager : ObservableObject {
    public static let shared = ThemeManager()
    
    @Published public var currentTheme: Theme = .sky
    
    private init() {}
    
    public func setTheme(_ theme : Theme) {
        currentTheme = theme
    }
}
