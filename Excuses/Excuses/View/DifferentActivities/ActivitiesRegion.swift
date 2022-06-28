//
//  ActivitiesRegion.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 28.6.22..
//

import SwiftUI

struct ActivitiesRegion: View {
    @ObservedObject var activityVM = ActivityViewModel()

    @State private var degrees = 0.0
    
    @State private var filter = ""

    
    var body: some View {
        VStack {
            Text("Swipe left or right to get a new activity suggestion.").foregroundColor(Color(hex: "C6DE41")).font(.subheadline).italic().padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            
                withAnimation(.easeInOut) {
                    ActivityCard(activityVM: activityVM)
                    .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0)).gesture(DragGesture(minimumDistance: 20, coordinateSpace: .global)
                        .onEnded { value in
                            let horizontalAmount = value.translation.width as CGFloat
                            let verticalAmount = value.translation.height as CGFloat
                            
                            if abs(horizontalAmount) > abs(verticalAmount) {
                                if horizontalAmount > 0 {
                                    withAnimation(.spring()) {
                                        self.degrees += 360
                                    }
                                }
                                else {
                                    withAnimation(.spring()) {
                                        self.degrees -= 360
                                    }
                                }
                            activityVM.getActivity()

                            }
                        })
                }
            
        }.onAppear {
            activityVM.getActivity()
        }
        
    }
}

struct ActivitiesRegion_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesRegion()
    }
}
