//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Alan Romano on 8/27/24.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    @StateObject var defaultDocument = EmojiArtDocument()
    @StateObject var paletteStore = PaletteStore(named: "Main")
    @StateObject var paletteStore2 = PaletteStore(named: "Alternate")
    @StateObject var paletteStore3 = PaletteStore(named: "Special")
    
    var body: some Scene {
        WindowGroup {
//            PaletteManager(stores: [paletteStore, paletteStore2, paletteStore3])
            EmojiArtDocumentView(emojiArtDocument: defaultDocument)
                .environmentObject(paletteStore)
        }
    }
}
