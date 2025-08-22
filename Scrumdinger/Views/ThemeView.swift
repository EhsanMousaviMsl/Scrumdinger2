//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Ehsan Mousavi on 8/22/25.
//

import SwiftUI
import MyThemeKit

struct ThemeView: View {
    
    let theme : Theme
    var body: some View {
        Text("\(theme.name)")
            .padding(4)
            .frame(maxWidth: .infinity)
            .foregroundColor(theme.accentColor)
            .background(theme.mainColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ThemeView(theme: .green)
            ThemeView(theme: .green)
                .preferredColorScheme(.dark)
        }
    }
}
