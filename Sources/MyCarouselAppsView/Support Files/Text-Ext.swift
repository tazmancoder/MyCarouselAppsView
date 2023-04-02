//
//  Text-Ext.swift
//  TestApp-MyCarouselAppsView
//
//  Created by Mark Perryman on 4/1/23.
//

import SwiftUI

/// This allows me to extend the Text publicly which allows me to do the
/// following: Text(.someTextView) where someTextView is defined as so:
///
///
/// static let someTextView = Text(
///     "Some Text",
///     tableName: "SomeTextView+Strings",
///     comment: "Some comment about how this text is used within the app"
/// )
///
/// This is a great way to do localization of all your strings withing the
/// app.
public extension Text {
    // Creates a Text view from another Text view for isolating localization entries
    init(_ text: Text) {
        self = text
    }
}
