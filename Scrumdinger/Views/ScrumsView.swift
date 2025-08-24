//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Ehsan Mousavi on 8/18/25.
//

import SwiftUI

struct ScrumsView: View {
    
    @State private var isPresentingNewScrumView = false
    @Binding var scrums : [DailyScrum]
    
    var body: some View {
        NavigationView{
            List($scrums){ $scrum in
                NavigationLink(destination: DetailView(scrum:$scrum)){
                CardView(scrum: scrum)
            }
            .listRowBackground(scrum.theme.mainColor)

        }
            .navigationTitle("Daily Scrum")
            .toolbar {
                Button(action:{
                    isPresentingNewScrumView = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        
    }
        .sheet(isPresented: $isPresentingNewScrumView){
            NewScrumSheet(scrums: $scrums)
        }
}

}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper4(DailyScrum.sampleData) { scrums in
            ScrumsView(scrums: scrums)
        }
    }
}


struct StatefulPreviewWrapper4<Value, Content: View> : View {
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

