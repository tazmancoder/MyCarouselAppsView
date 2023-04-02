//
//  AppDescriptionView.swift
//  TestApp-MyCarouselAppsView
//
//  Created by Mark Perryman on 4/1/23.
//

import Foundation
import SwiftUI
import ViewModifierKit
import DeviceKit

public struct AppDescriptionView: View {
    // MARK: - Properties
    var card: AppCardModel
    
    // MARK: - State
    @State private var device = Device.current
    
    public init(card: AppCardModel) {
        self.card = card
    }
    
    public var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                // App What's New Section
                Group {
                    Text(.myAppWhatsNewSection)
                        .textViewModifier(for: .title3, weight: .semibold, color: .primary)
                    
                    HStack(alignment: .lastTextBaseline) {
                        Text(.catalogVersion + Text(verbatim: " ") + Text(card.appData.version ?? "No Version Info"))
                            .textViewModifier(for: device.isPad ? .body : .subheadline, weight: .regular, color: .secondary)

                        Spacer()

                        if let _ = card.appData.releaseDate {
                            Text(determineHowManyMonthsAgo() ?? "N/A")
                                .textViewModifier(for: device.isPad ? .body : .subheadline, weight: .regular, color: .secondary)
                        }
                    }
                    .bottomPadding()
                    
                    Text(card.appData.releaseNotes ?? "No Release Notes Available")
                        .textViewModifier(for: .body, weight: .regular, color: .secondary)
                }

                Divider()

                // App Description Section
                Group {
                    Text(.myAppDescriptionTitle)
                        .textViewModifier(for: .title3, weight: .semibold, color: .primary)
                        .bottomPadding(howMuch: 5)

                    Text(card.appData.description ?? "No Description Data Available")
                        .textViewModifier(for: .body, weight: .regular, color: .secondary)
                }

                Divider()
                
                // App Information Section
                Group {
                    Text(.myAppInformationSection)
                        .textViewModifier(for: .title3, weight: .semibold, color: .primary)
                        .bottomPadding(howMuch: 5)

                    HStack(alignment: .center) {
                        Text(.myAppSeller)
                            .textViewModifier(for: device.isPad ? .body : .subheadline, weight: .regular, color: .secondary)
                        Spacer()
                        Text(card.appData.artistName)
                            .textViewModifier(for: device.isPad ? .body : .subheadline, weight: .regular, color: .primary)
                    }
                    
                    Divider()

                    HStack(alignment: .center) {
                        Text(.myAppSize)
                            .textViewModifier(for: device.isPad ? .body : .subheadline, weight: .regular, color: .secondary)
                        Spacer()
                        Text(ConvertUnits(bytes: Int64(card.appData.fileSizeBytes ?? "0") ?? 0).getReadableUnit())
                            .textViewModifier(for: device.isPad ? .body : .subheadline, weight: .regular, color: .primary)
                    }
                    
                    Divider()

                    HStack(alignment: .center) {
                        Text(.myAppCompatibility)
                            .textViewModifier(for: device.isPad ? .body : .subheadline, weight: .regular, color: .secondary)
                        Spacer()
                        Text(findCompatibility() ?? "No Compatibility Found")
                            .textViewModifier(for: device.isPad ? .body : .subheadline, weight: .regular, color: .primary)
                    }
                }
            }
        }
        .horizontalPadding()
        .bottomPadding()
    }
    
    private func findCompatibility() -> String? {
        if device.isPad {
            if ((card.appData.supportedDevices?.contains(["iPad"])) != nil) {
                return String(localized: "Works on this iPad", table: "AppDescriptionView+Strings", comment: "Compatibility comment")
            }
        } else if device.isPhone {
            if ((card.appData.supportedDevices?.contains(["iPhone"])) != nil) {
                return String(localized: "Works on this iPhone", table: "AppDescriptionView+Strings", comment: "Compatibility comment")
            }
        } else {
            if ((card.appData.supportedDevices?.contains(["iPod"])) != nil) {
                return String(localized: "Works on this iPod", table: "AppDescriptionView+Strings", comment: "Compatibility comment")
            }
        }
        
        return nil
    }
    
    private func determineHowManyMonthsAgo() -> String? {
        let date = Date.now
        if let cardDate = card.appData.currentVersionReleaseDate {
            let years = date.years(from: cardDate)
            let months = date.months(from: cardDate)
            let weeks = date.weeks(from: cardDate)
            let days = date.days(from: cardDate)

            if days <= 7 {
                let daysAgo = String(localized: "d ago", table: "AppDescriptionView+Strings", comment: "Days String")
                return String(String(days) + daysAgo)
            } else if weeks <= 4 {
                let weeksAgo = String(localized: "w ago", table: "AppDescriptionView+Strings", comment: "Weeks String")
                return String(String(weeks) + weeksAgo)
            } else if months <= 12 {
                let monthsAgo = String(localized: "m ago", table: "AppDescriptionView+Strings", comment: "Months String")
                return String(String(months) + monthsAgo)
            } else {
                let yearsAgo = String(localized: "y ago", table: "AppDescriptionView+Strings", comment: "Years String")
                return String(String(years) + yearsAgo)
            }
        }
        
        return nil
    }
}
