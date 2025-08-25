//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Ehsan Mousavi on 8/17/25.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    
    @Binding var scrum : DailyScrum
    @StateObject private var scrumTimer = ScrumTimer()
    
    private let player = AVPlayer.dingPlayer
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack{
                MeetingHeaderView(secondElapsed: scrumTimer.secondsElapsed, secondReminding: scrumTimer.secondsRemaining, theme: scrum.theme)
                Circle()
                    .strokeBorder(lineWidth: 24)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)


            }
        }
        
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .onAppear {
            startScrum()
        }
        .onDisappear{
            endScrum()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func startScrum() {
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendeeNames: scrum.attendees.map{$0.name})
        scrumTimer.startScrum()
        scrumTimer.speakerChangedAction = {
            player.seek(to: .zero)
            player.play()
        }
        scrumTimer.startScrum()
    }
    
    func endScrum() {
        scrumTimer.stopScrum()
        let newHistory = History(attendees: scrum.attendees)
        scrum.history.insert(newHistory, at: 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}



extension AVPlayer {
    static var dingPlayer : AVPlayer {
        guard let url = Bundle.main.url(forResource: "ding", withExtension: "wav") else {
            fatalError("Faild to find ding.wav in bundle")
        }
        return AVPlayer(url:url)
    }
}
