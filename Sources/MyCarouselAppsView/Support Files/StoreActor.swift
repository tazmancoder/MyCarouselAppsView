//
//  StoreActor.swift
//  TestApp-MyCarouselAppsView
//
//  Created by Mark Perryman on 4/1/23.
//

import SwiftUI

actor Store {
    @MainActor @Published var storeData = [AppCardModel]()
    
    func append(data: [AppCardModel]) {
        Task { @MainActor in
            if storeData.isEmpty {
                storeData.append(contentsOf: data)
            }
        }
    }
}
