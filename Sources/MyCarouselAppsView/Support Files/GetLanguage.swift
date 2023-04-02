//
//  GetLanguage.swift
//  TestApp-MyCarouselAppsView
//
//  Created by Mark Perryman on 4/1/23.
//

import Foundation

enum Language: String {
    case en
    
    var type: String {
        switch self {
        case .en:
            return "English"
        }
    }
}

struct GetLanguage {
    static func getLongVersion(language: String) -> String? {
        if language == Language.en.rawValue {
            return Language.en.type
        }
        
        // If no language was found
        return nil
    }
}
