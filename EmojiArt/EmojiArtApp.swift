//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Alan Romano on 8/27/24.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    
    
    var body: some Scene {
        DocumentGroup(newDocument: { EmojiArtDocument() }) { config in
            EmojiArtDocumentView(emojiArtDocument: config.document)
        }
    }
}
