//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Ehsan Mousavi on 8/22/25.
//

import SwiftUI
import MyThemeKit

struct ThemePicker: View {
    
    @Binding var selection : Theme
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.all) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.segmented)
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(Theme.green) { binding in
            ThemePicker(selection: binding)
        }
    }
}


struct StatefulPreviewWrapper<Value, Content: View> : View {
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
