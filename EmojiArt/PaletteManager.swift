//
//  PaletteManager.swift
//  EmojiArt
//
//  Created by Alan Romano on 9/4/24.
//

import SwiftUI

struct PaletteManager: View {
    let stores: [PaletteStore]
    @State private var selectedStore: PaletteStore?
    
    var body: some View {
        NavigationSplitView {
            List(stores, selection: $selectedStore) { store in
                Text(store.name)
                    .tag(store)
            }
        } content: {
            if let selectedStore {
                EditablePaletteList(store: selectedStore)
            } else {
                Text("Chosse a store")
            }
            
        }
        detail: {
            Text("Choose a palette")
        }
    }
}

//#Preview {
//    PaletteManager()
//}
