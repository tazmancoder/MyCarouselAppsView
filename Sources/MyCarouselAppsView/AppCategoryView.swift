//
//  AppCategoryView.swift
//  TestApp-MyCarouselAppsView
//
//  Created by Mark Perryman on 4/1/23.
//

import SwiftUI
import ViewModifierKit

public struct AppCategoryView: View {
    // MARK: - Properties
    var card: AppCardModel
    var title: Text
    
    public init(card: AppCardModel, title: Text) {
        self.card = card
        self.title = title
    }
    
    public var body: some View {
        VStack {
            title
                .textViewModifier(for: .caption, weight: .regular, color: .secondary)
                
            Image(systemName: "globe")
                .font(.title2)
                .foregroundColor(.secondary)
                .bold()
                .genericPadding(howMuch: 1)

            Text(card.appData.primaryGenreName!)
                .textViewModifier(for: .caption, weight: .regular, color: .secondary)
        }
    }
}
