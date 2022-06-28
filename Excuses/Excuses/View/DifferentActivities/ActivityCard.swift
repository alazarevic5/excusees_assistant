//
//  ActivityCard.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 28.6.22..
//

import SwiftUI

struct ActivityCard: View {
    
    
    @ObservedObject var activityVM = ActivityViewModel()
    
    var body: some View {
        ZStack (alignment: .topTrailing) {
            VStack {
                Text(activityVM.activity.activity).padding(50).foregroundColor(Color(hex: "071C21")).background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(colors: [Color(hex: "C6DE41"), Color(hex: "647021")], startPoint: .top, endPoint: .bottom)))
                HStack {
                    Text("Type: \(activityVM.activity.type)").font(.caption).foregroundColor(Color(hex: "C6DE41")).padding(10).overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "2D6E7E"), lineWidth: 1)
                    )
                    Text("Participants: \(activityVM.activity.participants)").font(.caption).foregroundColor(Color(hex: "C6DE41")).padding(10).overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "2D6E7E"), lineWidth: 1)
                    )
                }.padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            }
            
            
        }.padding().padding().shadow(color: Color(hex: "2D6E7E"), radius: 25, x: 0, y: 0)
}
}

struct ActivityCard_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCard()
    }
}
