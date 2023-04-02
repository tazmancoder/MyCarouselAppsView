//
//  LocalizedAppConstants.swift
//  TestApp-MyCarouselAppsView
//
//  Created by Mark Perryman on 4/1/23.
//

import Foundation

enum LocalizedAppConstants {
    static let shareAppLinkSubject = String(localized: "Shared App Link", table: "Email+Strings", comment: "Subject for sharing an app link")
    static let shareingAppLinkBody = String(localized: "\n\nThank you for your interest in our app. Above you will find the link to the App on the AppStore. Tap it and you will be redirected to the AppStore where you can download the App", table: "Email+Strings", comment: "Body of the email.")
}

