//
//  AppAgeView.swift
//  TestApp-MyCarouselAppsView
//
//  Created by Mark Perryman on 4/1/23.
//

import SwiftUI
import ViewModifierKit

public struct AppAgeView: View {
    // MARK: - Properties
    var card: AppCardModel
    var title: Text
    var subTitle: Text
    
    public init(card: AppCardModel, title: Text, subTitle: Text) {
        self.card = card
        self.title = title
        self.subTitle = subTitle
    }
    
    public var body: some View {
        VStack {
            title
                .textViewModifier(for: .caption, weight: .regular, color: .secondary)
            
            Text(card.appData.contentAdvisoryRating!)
                .textViewModifier(for: .title2, weight: .bold, color: .secondary)
                .genericPadding(howMuch: 1)

            subTitle
                .textViewModifier(for: .caption, weight: .regular, color: .secondary)
        }
    }
}
