//
//  CardView.swift
//  Scrumdinger
//
//  Created by Ehsan Mousavi on 8/18/25.
//

import SwiftUI

struct CardView: View {
    
    let scrum : DailyScrum
    
    var body: some View {
        VStack(alignment:.leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack{
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)",systemImage: "clock")
                    .accessibilityLabel("\(scrum.lengthInMinutes) minutes meeting")
                    .labelStyle(.trailingIcon)
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let scrum = DailyScrum.sampleData[0]
        CardView(scrum:scrum)
            .preferredColorScheme(.light)
            .previewLayout(.fixed(width: 400, height: 60))
            .background(scrum.theme.mainColor)
        
    }
}
