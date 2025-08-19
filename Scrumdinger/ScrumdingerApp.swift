//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Ehsan Mousavi on 8/17/25.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
