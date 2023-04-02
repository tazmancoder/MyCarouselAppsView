//
//  AppStoreDefenitions.swift
//  TestApp-MyCarouselAppsView
//
//  Created by Mark Perryman on 4/1/23.
//

import Foundation

// MARK: - AppStore JSON Data
struct AppStoreDataJSON: Codable {
    let resultCount: Int
    let results: [AppDataJSON]
}

// MARK: - AppStore App Data
struct AppDataJSON: Codable {
    let wrapperType: String
    let artistType: String?
    let artistName: String
    let artistID: Int
    let artworkUrl100: String?
    let artistViewURL: String?
    let features, supportedDevices: [String]?
    let kind: String?
    let trackViewURL: String?
    let trackContentRating, minimumOSVersion, trackCensoredName: String?
    let languageCodesISO2A: [String]?
    let fileSizeBytes, formattedPrice, contentAdvisoryRating: String?
    let currentVersionReleaseDate: Date?
    let releaseNotes, primaryGenreName: String?
    let primaryGenreID: Int?
    let sellerName, description: String?
    let genreIDS: [String]?
    let bundleID: String?
    let isVppDeviceBasedLicensingEnabled: Bool?
    let trackID: Int?
    let trackName: String?
    let releaseDate: Date?
    let version, currency: String?
    let price: Double?
    let genres: [String]?
    let userRatingCount: Int?

    enum CodingKeys: String, CodingKey {
        case wrapperType, artistType, artistName
        case artistID = "artistId"
        case artworkUrl100
        case artistViewURL = "artistViewUrl"
        case features, supportedDevices, kind
        case trackViewURL = "trackViewUrl"
        case trackContentRating
        case minimumOSVersion = "minimumOsVersion"
        case trackCensoredName, languageCodesISO2A, fileSizeBytes, formattedPrice, contentAdvisoryRating, currentVersionReleaseDate, releaseNotes, primaryGenreName
        case primaryGenreID = "primaryGenreId"
        case sellerName, description
        case genreIDS = "genreIds"
        case bundleID = "bundleId"
        case isVppDeviceBasedLicensingEnabled
        case trackID = "trackId"
        case trackName, releaseDate, version, currency, price, genres, userRatingCount
    }
}


