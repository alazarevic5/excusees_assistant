//
//  DifferentExcusesBtn.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 8.7.22..
//

import SwiftUI

struct DifferentExcusesBtn: View {
    @State var title: String
    @State var imageName:String
    var body: some View {
        HStack {
            Spacer()
                  Image(imageName)
            
                  Text(title)
            Spacer()
          }
          .padding()
          .foregroundColor(.white)
          .background(.thinMaterial,
                      in: RoundedRectangle(cornerRadius: 20, style: .continuous)).shadow(color: Color(hex: "2D6E7E"), radius: 7, x: 0, y: 0)
    }
}

struct DifferentExcusesBtn_Previews: PreviewProvider {
    static var previews: some View {
        DifferentExcusesBtn(title: "Test", imageName: "different_excuses")
    }
}
