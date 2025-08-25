//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Ehsan Mousavi on 8/18/25.
//

import Foundation
import MyThemeKit

struct DailyScrum : Identifiable {
    let id : UUID
    var title : String
    var attendees : [Attendees]
    var lengthInMinutes : Int
    var lengthInMinutesAsDouble : Double {
        get{
            return Double(lengthInMinutes)
        }
        set{
            lengthInMinutes = Int(newValue)
        }
        
    }
    var theme : Theme
    var history : [History] = []
    
    init(id : UUID = UUID(), title: String, attendees: [String], lengthInMinutes:Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map{Attendees(name: $0)}
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    struct Attendees : Identifiable {
        let id : UUID
        var name : String
        
        init(id : UUID = UUID(), name : String){
            self.id = id
            self.name = name
        }
    }
    
    static var emptyScrum : DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
    }
}



extension DailyScrum {
    static let sampleData : [DailyScrum] = [
        DailyScrum(
            title: "Design",
            attendees: ["Ehsan","Yahya","Sina"],
            lengthInMinutes: 15,
            theme: .sky),
        DailyScrum(
            title: "App Dev",
            attendees: ["Erfan","Ehsan","Milad"],
            lengthInMinutes: 20,
            theme: .lavender),
        DailyScrum(
            title: "Web Dev",
            attendees: ["Sina","Yahya"],
            lengthInMinutes: 25,
            theme: .orange),
    ]
}
