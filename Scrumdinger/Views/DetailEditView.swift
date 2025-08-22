//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Ehsan Mousavi on 8/18/25.
//

import SwiftUI

struct DetailEditView: View {
    
    @Binding var scrum : DailyScrum
    @State private var attendeeName = ""
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")){
                TextField("Title", text: $scrum.title)
                HStack{
                    Slider(value: $scrum.lengthInMinutesAsDouble, in : 5...30, step: 1){
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
            }
            ThemePicker(selection: $scrum.theme)
            Section(header: Text("Attendees")){
                ForEach(scrum.attendees){ attendee in
                    Text("\(attendee.name)")
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $attendeeName)
                    Button(action:{
                        withAnimation{
                            let attendee = DailyScrum.Attendees(name:attendeeName)
                            scrum.attendees.append(attendee)
                            attendeeName = ""
                        }
                    }){
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("add attendee")
                    }
                    .disabled(attendeeName.isEmpty)
                }
            }
        }
    }
}


struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper2(DailyScrum.sampleData[0]) { scrum in
            DetailEditView(scrum: scrum)
        }
    }
}


struct StatefulPreviewWrapper2<Value, Content: View> : View {
    @State private var value : Value
    private let content : (Binding<Value>) -> Content
    
    init (_ initialValue: Value, @ViewBuilder content: @escaping (Binding<Value>) -> Content) {
        _value = State(initialValue: initialValue)
        self.content = content
    }
    
    var body: some View{
        content($value)
    }
}
