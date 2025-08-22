//
//  ScrumDetailView.swift
//  Scrumdinger
//
//  Created by Ehsan Mousavi on 8/18/25.
//

import SwiftUI
import MyThemeKit

struct DetailView: View {
    
    @Binding var scrum : DailyScrum
    @State private var isPresentingEditView = false
    @State private var editingScrum = DailyScrum.emptyScrum
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")){
                NavigationLink(destination: MeetingView()){
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(scrum.theme.mainColor)
                }
                
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text("\(scrum.theme.name)")
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(5)
                }
                .accessibilityElement(children: .combine)
            }
            
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label("\(attendee.name)", systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit"){
                isPresentingEditView = true
                editingScrum = scrum
            }
        }
        .sheet(isPresented:$isPresentingEditView){
            NavigationView{
                DetailEditView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction){
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction){
                            Button("Done") {
                                isPresentingEditView = false
                                scrum = editingScrum

                            }
                        }
                    }
            }
        }
    }
}

//struct ScrumDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(scrum: DailyScrum.sampleData[0])
//    }
//}
struct ScrumDetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper3(DailyScrum.sampleData[0]) { scrum in
            DetailView(scrum: scrum)
        }
    }
}


struct StatefulPreviewWrapper3<Value, Content: View> : View {
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
