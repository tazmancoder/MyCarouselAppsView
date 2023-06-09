//
//  MyCarouselAppsView.swift
//  TestApp-MyCarouselAppsView
//
//  Created by Mark Perryman on 4/1/23.
//

import SwiftUI
import ViewModifierKit

public struct MyCarouselAppsView: View {
    // MARK: - Environment
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Properties
    var urlString: String
    
    // MARK: - State
    @State private var store = Store()
    
    public init(from urlString: String) {
        self.urlString = urlString
        fetchDataAndDecode(from: URL(string: urlString)!, to: store)
    }
    
    public var body: some View {
        VStack {
            TabView {
                ForEach(store.storeData) { card in
                    let _ = print("Got Here")
                    let _ = print("AppName: \(card.appData.trackName ?? "No Track Name")")
                    CardView(card: card)
                        .bottomPadding()
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }, label: {
                        Text("Cancel")
                            .textViewModifier(for: .body, weight: .regular, color: .accentColor)
                    })
                }
            }
        }
    }
        
    func fetchDataAndDecode(from url: URL, to store: Store) {
        Task {
            do {
                let appData = try await URLSession.shared.decode(AppStoreDataJSON.self, from: url)
                await store.append(data: processData(for: appData.results))
            } catch let DecodingError.keyNotFound(key, context) {
                fatalError("Failed to decode from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
            } catch let DecodingError.typeMismatch(_, context) {
                fatalError("Failed to decode from bundle due to type mismatch – \(context.debugDescription)")
            } catch let DecodingError.valueNotFound(type, context) {
                fatalError("Failed to decode from bundle due to missing \(type) value – \(context.debugDescription)")
            } catch DecodingError.dataCorrupted(_) {
                fatalError("Failed to decode from bundle because it appears to be invalid JSON")
            } catch {
                fatalError("Failed to decode \(url) from bundle: \(error.localizedDescription)")
            }
        }
    }

    func processData(for data: [AppDataJSON]) -> [AppCardModel] {
        var model = [AppCardModel]()

        for datum in data {
            if datum.trackName != nil {
                model.append(AppCardModel(id: UUID(), appData: datum))
                print("AppName: \(datum.trackName!)")
            }
        }

        print("Model: \(model.count)")
        return model
    }
}

// MARK: - CardView
public struct CardView: View {
    // MARK: - Environment
    @Environment(\.dismiss) var dismiss

    // MARK: - State
    @State private var showLargerQRCode = false

    // MARK: - Properties
    var card: AppCardModel
    
    public init(card: AppCardModel) {
        self.card = card
    }
    
    public var body: some View {
        VStack {
            CardPageHeaderView(card: card, showLargerQRCode: $showLargerQRCode)
            
            Divider()
            
            AppInformationView(card: card)
            
            Divider()
            
            AppDescriptionView(card: card)
            
            Spacer()
        }
    }
}

