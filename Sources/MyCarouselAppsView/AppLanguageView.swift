//
//  AppLanguageView.swift
//  TestApp-MyCarouselAppsView
//
//  Created by Mark Perryman on 4/1/23.
//

import SwiftUI
import ViewModifierKit

struct AppLanguageView: View {
    // MARK: - Properties
    var card: AppCardModel
    var title: Text
    
    var body: some View {
        VStack {
            title
                .textViewModifier(for: .caption, weight: .regular, color: .secondary)
                
            Text(Locale.current.language.languageCode!.identifier.uppercased())
                .font(.title2)
                .foregroundColor(.secondary)
                .bold()
                .genericPadding(howMuch: 1)

            Text(GetLanguage.getLongVersion(language: Locale.current.language.languageCode!.identifier) ?? "N/A")
                .textViewModifier(for: .caption, weight: .regular, color: .secondary)
        }
    }
}
