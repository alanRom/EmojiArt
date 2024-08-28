//
//  EmojiArtDocument.swift
//  EmojiArt
//
//  Created by Alan Romano on 8/27/24.
//

import SwiftUI

class EmojiArtDocument: ObservableObject {
    typealias Emoji = EmojiArt.Emoji
    
    private var emojiArt = EmojiArt()
    
    init( ) {
        emojiArt.addEmoji("🚲", at: .init(x: -200, y: -150), size: 200)
        emojiArt.addEmoji("🔥", at: .init(x: 250, y: 100), size: 200)
    }
    
    var emojis: [Emoji] {
        emojiArt.emojis
    }
    
    var background: URL? {
        emojiArt.background
    }
    
    // MARK: - Intents
    
    func setBackgrond(_ url: URL?){
        emojiArt.background = url
    }
    
    func addEmoji(_ emoji: String, at position: Emoji.Position, size: CGFloat){
        emojiArt.addEmoji(emoji, at:position, size: Int(size))
    }
    
    
}

extension EmojiArt.Emoji {
    var font: Font {
        Font.system(size: CGFloat(size))
    }
}

extension EmojiArt.Emoji.Position {
    func `in`(_ geometry: GeometryProxy) -> CGPoint {
        let center = geometry.frame(in: .local).center
        return CGPoint(
            x: center.x + CGFloat(x),
            y: center.y - CGFloat(y)
        )
        
        
    }
}
