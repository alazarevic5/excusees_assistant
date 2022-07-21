//
//  ExcuseCard.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 25.6.22..
//

import SwiftUI
import Combine
import CoreData

struct ExcuseCard: View {
    
    @ObservedObject var excuseVM = ExcusesViewModel()
        
    @State var isHidden = false
        
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: ExcuseMO.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "cnt", ascending: true)])
    
    private var savedExcuses: FetchedResults<ExcuseMO>
    
    var body: some View {
            ZStack (alignment: .topTrailing) {
                Text(excuseVM.excuses.first?.excuse ?? "---").font(.body).padding(50).foregroundColor(Color(hex: "C6DE41")).background(RoundedRectangle(cornerRadius: 20).fill(RadialGradient(gradient: Gradient(colors: [Color(hex: "282f30"), Color(hex: "000c0f")]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/, endRadius: /*@START_MENU_TOKEN@*/500/*@END_MENU_TOKEN@*/)))
                
            }.padding().padding().shadow(color: Color(hex: "2D6E7E"), radius: 25, x: 0, y: 0)
    }
}

struct ExcuseCard_Previews: PreviewProvider {
    static var previews: some View {
        ExcuseCard(excuseVM: ExcusesViewModel())
    }
}

