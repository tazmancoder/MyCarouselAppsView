//
//  EnlargeQRCodeView.swift
//  TestApp-MyCarouselAppsView
//
//  Created by Mark Perryman on 4/1/23.
//

import SwiftUI
import DeviceKit
import ViewModifierKit

struct EnlargeQRCodeView: View {
    // MARK: - Environment
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Properties
    var card: AppCardModel
    
    // MARK: - State
    @State private var device = Device.current
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: card.appData.artworkUrl100!)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(
                width: !device.isPad ? 100 : 125,
                height: !device.isPad ? 100 : 125
            )
            .cornerRadius(10)
            .topPadding(howMuch: 20)
            .horizontalPadding(howMuch: 5)
            .bottomPadding(howMuch: 5)

            Text(card.appData.trackName!)
                .textViewModifier(for: .largeTitle, weight: .semibold, color: .primary)
                .horizontalPadding(howMuch: 40)
                .bottomPadding(howMuch: 30)
            
            if let image = generateQRCode(for: card.appData) {
                Image(uiImage: image)
            }
                        
            Text.scanningQRCodeMessage
                .textViewModifier(for: .body, weight: .regular, color: .secondary)
                .multilineTextAlignment(.center)
                .lineLimit(5)
                .horizontalPadding(howMuch: 30)
                .bottomPadding(howMuch: 30)

            Text.sharingQRCodeMessage
                .textViewModifier(for: .body, weight: .regular, color: .secondary)
                .multilineTextAlignment(.center)
                .horizontalPadding(howMuch: 30)
                .bottomPadding()
            
            ShareLink(
                item: URL(string: card.appData.trackViewURL!)!,
                subject: Text(LocalizedAppConstants.shareAppLinkSubject),
                message: Text(LocalizedAppConstants.shareingAppLinkBody),
                preview: SharePreview(
                    card.appData.trackName!,
                    image: Image(systemName: "square.and.arrow.up")
                ),
                label: {
                    Label("Share App Link", systemImage: "square.and.arrow.up")
                }
            )
            .buttonStyle(.bordered)
            .bottomPadding(howMuch: 40)
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }, label: {
                    Text("Cancel")
                        .textViewModifier(for: .body, weight: .regular, color: .accentColor)
                })
            }
        }
    }
    
    private func generateQRCode(for data: AppDataJSON) -> UIImage? {
        if let data = data.trackViewURL?.data(using: .ascii) {
            let qrCode = QRCode(inputMessage: data)
            if let tempImg = BarcodeService.generateBarcode(
                from: qrCode,
                scalar: !device.isPad ? 5 : 6
            ) {
                return tempImg
            }
        }
        
        return nil
    }
}


