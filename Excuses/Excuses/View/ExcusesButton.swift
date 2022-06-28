//
//  ExcusesButton.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 25.6.22..
//

import SwiftUI

struct ExcusesButton: View {
    
    @State var title: String
    @State var imageName:String
    
    var body: some View {
      VStack {
                Image(imageName)
                Text(title)
        }
        .padding()
        .foregroundColor(.white)
        .background(.thinMaterial,
                    in: RoundedRectangle(cornerRadius: 20, style: .continuous)).shadow(color: Color(hex: "2D6E7E"), radius: 7, x: 0, y: 0)
    }
}

struct ExcusesButton_Previews: PreviewProvider {
    static var previews: some View {
        ExcusesButton(title: "Designer excuses", imageName: "art")
    }
}
