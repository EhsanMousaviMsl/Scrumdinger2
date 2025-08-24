//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Ehsan Mousavi on 8/22/25.
//

import SwiftUI
import MyThemeKit

struct MeetingHeaderView: View {
    @State private var timer = MeetingTimer(duration: 300)
    let secondElapsed : Int
    let secondReminding : Int
    let theme : Theme
    
    private var totalSeconds : Int {
        secondElapsed + secondReminding
    }
    private var progress : Double {
        guard totalSeconds > 0 else {return 1}
        return Double(secondElapsed) / Double(totalSeconds)
    }
    private var minutesRemaining : Int {
        secondReminding / 60
    }
    var body: some View {
        VStack{
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            HStack{
                VStack(alignment:.leading){
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondElapsed)",systemImage: "hourglass.tophalf.fill")

                }
                Spacer()
                VStack(alignment:.trailing){
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondReminding)", systemImage: "hourglass.bottomhalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
        }
        
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) Minutes")
        .padding([.top,.horizontal])
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondElapsed: 60, secondReminding: 180, theme:.sky)
            .previewLayout(.sizeThatFits)
    }
}
