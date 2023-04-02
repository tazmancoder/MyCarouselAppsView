//
//  CardPageHeaderView.swift
//  TestApp-MyCarouselAppsView
//
//  Created by Mark Perryman on 4/1/23.
//

import SwiftUI
import DeviceKit
import ViewModifierKit

public struct CardPageHeaderView: View {
    // MARK: - Properties
    var card: AppCardModel
    
    // MARK: - Bindings
    @Binding var showLargerQRCode: Bool
    
    // MARK: - State
    @State private var device = Device.current
    
    public init(card: AppCardModel, showLargerQRCode: Binding<Bool>) {
        self.card = card
        self._showLargerQRCode = showLargerQRCode // How to set a @Binding property wrapper
    }
    
    public var body: some View {
        HStack {
            AsyncImage(url: URL(string: card.appData.artworkUrl100!)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(
                width: !device.isPad ? 75 : 100,
                height: !device.isPad ? 75 : 100
            )
            .cornerRadius(10)
            .topPadding()
            .horizontalPadding(howMuch: 5)
            .bottomPadding()
            
            VStack(alignment: .leading) {
                Text(card.appData.trackName!)
                    .textViewModifier(
                        for: !device.isPad ? .title3 : .title2,
                        weight: .bold,
                        color: .primary
                    )
                    .bottomPadding(howMuch: 5)
                
                Text(card.appData.formattedPrice!)
                    .textViewModifier(for: .caption, weight: .semibold, color: .primary)
                    .genericPadding(howMuch: 5)
                    .frame(minWidth: 75)
                    .background(Color.accentColor.opacity(0.2))
                    .cornerRadius(8)
            }
                            
            Spacer()
            
            VStack {
                if let image = generateQRCode(for: card.appData) {
                    Button {
                        showLargerQRCode.toggle()
                    } label: {
                        VStack {
                            Image(uiImage: image)
                            Text.showLargerQRCode
                                .textViewModifier(for: .caption, weight: .regular, color: .secondary)
                        }
                    }
                    .buttonStyle(.plain)
                    .sheet(isPresented: $showLargerQRCode) {
                        NavigationStack {
                            EnlargeQRCodeView(card: card)
                        }
                    }
                }
            }
        }
        .horizontalPadding()
    }
    
    private func generateQRCode(for data: AppDataJSON) -> UIImage? {
        if let data = data.trackViewURL?.data(using: .ascii) {
            let qrCode = QRCode(inputMessage: data)
            if let tempImg = BarcodeService.generateBarcode(
                from: qrCode,
                scalar: !device.isPad ? 1 : 1.5
            ) {
                return tempImg
            }
        }
        
        return nil
    }
}

