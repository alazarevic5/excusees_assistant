//
//  Categories.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 24.6.22..
//

import SwiftUI

struct Categories: View {
    
    
    @ObservedObject var excusesVM = ExcusesViewModel()
    
    @State private var isShown = false
        
    var body: some View {
            VStack {
                VStack {
                    Button(action: {
                        withAnimation(.easeInOut) {
                            self.isShown.toggle()
                        }
                    }) {
                        HStack {
                            Image("dots")
                            Text("Different excuses")
                        }
                    }
                    .padding()
                    .foregroundColor(.white).frame(minWidth: 0, maxWidth: .infinity)
                    .background(.thinMaterial,
                                in: RoundedRectangle(cornerRadius: 20, style: .continuous)).padding().shadow(color: Color(hex: "2D6E7E"), radius: 7, x: 0, y: 0)
                    if isShown {
                        DifferentExcusesRegion().transition(.move(edge: self.isShown ? .leading : .trailing))
                    }
                }
            }
            
    }
    
}

struct Categories_Previews: PreviewProvider {
    static var previews: some View {
        Categories()
    }
}
