//
//  AppCardModel.swift
//  TestApp-MyCarouselAppsView
//
//  Created by Mark Perryman on 4/1/23.
//

import SwiftUI

protocol AppCardModelProtocol: Identifiable {
    var id: UUID { get }
    var appData: AppDataJSON { get }
}

public struct AppCardModel: AppCardModelProtocol {
    public var id: UUID
    var appData: AppDataJSON
}
