//
//  AppInformationView.swift
//  TestApp-MyCarouselAppsView
//
//  Created by Mark Perryman on 4/1/23.
//

import SwiftUI
import DeviceKit

public struct AppInformationView: View {
    @State private var device = Device.current

    var card: AppCardModel
    
    public init(card: AppCardModel) {
        self.card = card
    }
    
    public var body: some View {
        GeometryReader { geo in
            HStack {
                Spacer()
                AppAgeView(card: card, title: .myAppAgeTitle, subTitle: .myAppAgeYearsOldTitle)
                    .frame(width: device.isPad ? geo.size.width * 0.22 : geo.size.width * 0.18)
                
                Divider()
                            
                AppDeveloperView(card: card, title: .myAppDeveloperTitle)
                    .frame(width: device.isPad ? geo.size.width * 0.27 : geo.size.width * 0.25)

                Divider()

                AppCategoryView(card: card, title: .myAppCategoryTitle)
                    .frame(width: device.isPad ? geo.size.width * 0.22 : geo.size.width * 0.18)

                Divider()
                
                AppLanguageView(card: card, title: .myAppLanguageTitle)
                    .frame(width: device.isPad ? geo.size.width * 0.22 : geo.size.width * 0.18)
                Spacer()
            }.fixedSize()
        }
        .frame(height: 75)
    }

}


