//
//  SaveExcuse.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 28.6.22..
//

import SwiftUI

struct SaveExcuse: View {
    var body: some View {
        Text("⭐️ Add to favourites").foregroundColor(Color(hex: "3f9eb5")).padding()
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
    }
}

struct SaveExcuse_Previews: PreviewProvider {
    static var previews: some View {
        SaveExcuse()
    }
}
