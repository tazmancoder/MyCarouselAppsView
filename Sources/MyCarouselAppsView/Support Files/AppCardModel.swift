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

struct AppCardModel: AppCardModelProtocol {
    var id: UUID
    var appData: AppDataJSON
}
