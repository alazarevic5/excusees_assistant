//
//  DiffExcusesView.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 11.7.22..
//

import SwiftUI

struct DiffExcusesView: View {
    

    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(hex: "153B44"), Color(hex: "071C21")], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            VStack {
                    Text("Click on category name to get a new excuse or swipe card left/right").foregroundColor(Color(hex: "8aa4ab")).font(.subheadline).italic().padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)).multilineTextAlignment(.center)
                
                DifferentExcusesRegion()

                    Spacer()
                }
        }
        .navigationBarTitle("Different excuses", displayMode: .inline)
    }
    
}

struct DiffExcusesView_Previews: PreviewProvider {
    static var previews: some View {
        DiffExcusesView()
    }
}
