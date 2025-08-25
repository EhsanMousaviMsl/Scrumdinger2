//
//  History.swift
//  Scrumdinger
//
//  Created by Ehsan Mousavi on 8/25/25.
//

import Foundation


struct History : Identifiable {
    let id : UUID
    let date : Date
    var attendees : [DailyScrum.Attendees]
    
    init(id : UUID = UUID(), date : Date = Date(), attendees: [DailyScrum.Attendees]) {
        self.id = id
        self.date = date
        self.attendees = attendees
    }
}
