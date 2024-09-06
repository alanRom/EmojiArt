//
//  PaletteEditor.swift
//  EmojiArt
//
//  Created by Alan Romano on 8/30/24.
//

import SwiftUI

struct PaletteEditor: View {
    @Binding var palette: Palette
    @State private var emojisToAdd: String = ""
    
    enum Focused {
        case name
        case addEmojis
    }
    
    @FocusState private var focused: Focused?
    
    
    private let emojiFont = Font.system(size: 40)
    var body: some View {
        Form {
            Section("Name"){
                TextField("Name", text: $palette.name)
                    .focused($focused, equals: .name)
            }
            
            Section("Emojis") {
                TextField("Add Emojis Here", text: $emojisToAdd)
                    .focused($focused, equals: .addEmojis)
                    .font(emojiFont)
                    .onChange(of: emojisToAdd) { oldEmojis, newEmojis in
                        palette.emojis = (newEmojis + palette.emojis)
                            .filter { $0.isEmoji }
                            .uniqued
                        
                    }
                    
                    
                removeEmojis
            }
                
        }
        .frame(minWidth: 300, minHeight: 350)
        .onAppear {
            if palette.name.isEmpty {
                focused = .name
            } else {
                focused = .addEmojis
            }
        }
    }
    
    var removeEmojis: some View {
        VStack(alignment: .trailing) {
            Text("Tap to Remove Emojis").font(.caption).foregroundStyle(.gray)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 40 ))]){
                ForEach(palette.emojis.uniqued.map(String.init), id: \.self) { emoji in
                    Text(emoji)
                        .font(emojiFont)
                        .onTapGesture {
                            withAnimation {
                                palette.emojis.remove(emoji.first!)
                                emojisToAdd.remove(emoji.first!)
                            }
                        }
                }
            }
        }
        
    }
}

#Preview {
    struct Preview: View {
        @State private var palette = PaletteStore(named: "Preview").palettes.first!
        var body: some View {
            PaletteEditor(palette: $palette)
        }
    }
    return Preview()
}
