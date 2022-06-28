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
    
    @State var isSaved: Bool
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: ExcuseMO.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "cnt", ascending: true)])
    private var savedExcuses: FetchedResults<ExcuseMO>
    
    var body: some View {
        ZStack (alignment: .topTrailing) {
            Text(excuseVM.excuses.first?.excuse ?? "---").font(.body).padding(50).foregroundColor(Color(hex: "071C21")).background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(colors: [Color(hex: "C6DE41"), Color(hex: "647021")], startPoint: .top, endPoint: .bottom)))
            Button {
                print("Tapped")
                withAnimation {
                    if isSaved {
                        print("obrisano")
                        PersistenceController.deleteExcuse(content: excuseVM.excuses.first!.excuse)
                        isSaved.toggle()
                    } else {
                        PersistenceController.saveExcuse(content: excuseVM.excuses.first?.excuse ?? "---", category: excuseVM.excuses.first?.category ?? "---")
                        print("sacuvano")
                        isSaved.toggle()
                    }
                    
                }
                
            } label: {
                Image(systemName: isSaved ? "star.fill" : "star").tint(Color(hex: "153B44"))
            }.padding()
            
        }.padding().padding().shadow(color: Color(hex: "2D6E7E"), radius: 25, x: 0, y: 0)
    }
}

struct ExcuseCard_Previews: PreviewProvider {
    static var previews: some View {
        ExcuseCard(excuseVM: ExcusesViewModel(), isSaved: true)
    }
}

