//
//  ActivityBtn.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 28.6.22..
//

import SwiftUI

struct ActivityBtn: View {
    
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
                        VStack {
                            HStack {
                                Image("dots")
                                Text("Activity suggestion")
                            }
                            Text("Make an excuse and do something else").foregroundColor(.gray).font(.caption).italic()
                        }
                    }
                    .padding()
                    .foregroundColor(.white).frame(minWidth: 0, maxWidth: .infinity)
                    .background(.thinMaterial,
                                in: RoundedRectangle(cornerRadius: 20, style: .continuous)).padding().shadow(color: Color(hex: "2D6E7E"), radius: 7, x: 0, y: 0)
                    if isShown {
                        ActivitiesRegion().transition(.move(edge: self.isShown ? .leading : .trailing))
                    }
                }
            }
            
    }
}

struct ActivityBtn_Previews: PreviewProvider {
    static var previews: some View {
        ActivityBtn()
    }
}
