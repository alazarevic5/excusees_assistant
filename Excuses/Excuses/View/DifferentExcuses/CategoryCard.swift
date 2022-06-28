//
//  CategoryCard.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 24.6.22..
//

import SwiftUI

struct CategoryCard: View {
    @ObservedObject var excusesVM = ExcusesViewModel()
    @State private var degrees = 0.0

    @State var title: String
    var body: some View {
        ZStack {
            Button(title.capitalized) {
                excusesVM.getExcuse(category: title)
                withAnimation(.spring()) {
                    self.degrees += 360  }
            }.foregroundColor(Color(hex: "C6DE41")).padding()
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
           // Text(title.capitalized)
        }
        .onAppear {
                excusesVM.getExcuse(category: "random")
        }
    }
       
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCard(title: "Test")
    }
}
