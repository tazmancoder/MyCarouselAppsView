//
//  URLSession-Ext.swift
//  TestApp-MyCarouselAppsView
//
//  Created by Mark Perryman on 4/1/23.
//


import Foundation

extension URLSession {
    
    /// Decodes JSON data downloaded from the internet
    ///
    /// This takes a URL to the iTunes API like the following:
    /// "https://itunes.apple.com/lookup?id=XXXXXXXXXX&entity=software"
    /// You'll need to replace the 10 X's with your own developer ID. This URL
    /// will then retrieve all the Apps you have on the AppStore
    ///
    /// - Parameters:
    ///   - type: Decodable Type (Structure)
    ///   - url: URL to JSON data
    /// - Returns: Decoded JSON Data
    func decode<T: Decodable>(
        _ type: T.Type = T.self,
        from url: URL
    ) async throws -> T {
        let (data, _) = try await data(from: url)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let decoded = try decoder.decode(T.self, from: data)
        
        return decoded
    }
}

