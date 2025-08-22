//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Ehsan Mousavi on 8/17/25.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack{
            ProgressView(value: 10, total: 15)
            HStack{
                VStack(alignment:.leading){
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300",systemImage: "hourglass.tophalf.fill")

                }
                Spacer()
                VStack(alignment:.trailing){
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("10 Minutes")
            
            Circle()
                .strokeBorder(lineWidth: 24)
            
            HStack{
                Text("Speaker 1 of 3")
                Spacer()
                Button(action:{}){
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next Speaker")
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
