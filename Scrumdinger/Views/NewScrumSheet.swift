//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Ehsan Mousavi on 8/24/25.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum
    @Binding var scrums : [DailyScrum]
    var body: some View {
        NavigationView {
            DetailEditView(scrum: $newScrum, saveEdits: {dailyscrum in
                scrums.append(newScrum)
            })
        }
    }
}

struct NewScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewScrumSheet(scrums: .constant(DailyScrum.sampleData))
    }
}
