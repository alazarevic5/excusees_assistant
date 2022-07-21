//
//  DifferentExcusesRegion.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 25.6.22..
//

import SwiftUI
import CoreData

struct DifferentExcusesRegion: View {
    
    @ObservedObject var excusesVM = ExcusesViewModel()
    @ObservedObject var categoriesViewModel = CategoryViewModel()
    
    @State private var degrees = 0.0
        
    @State private var selectedCategory = "random"
    
    @State var isHidden = false
        
    @FetchRequest(entity: ExcuseMO.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "cnt", ascending: true)])
    private var savedExcuses: FetchedResults<ExcuseMO>
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        VStack {
            ScrollView (.horizontal, showsIndicators: false) {
                HStack (alignment: .center, spacing: 7) {
                    ForEach (categoriesViewModel.categories, id: \.self) {
                        category in
                        
                        Button {
                            excusesVM.getExcuse(category: category.name)
                            selectedCategory = category.name
                            isHidden = false
                            withAnimation(.spring()) {
                                self.degrees += 360
                            }
                        } label: {
                            VStack (alignment: .center, spacing: 5) {
                                Image(systemName: category.systemImage).imageScale(.medium)
                                Text(category.name.capitalized)
                            }

                        }.foregroundColor(Color(hex: "C6DE41")).padding()
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20)).overlay(self.selectedCategory == category.name ? RoundedRectangle(cornerRadius: 20).stroke(Color(hex: "2D6E7E"), lineWidth: 2) : nil).animation(.spring())
                        
                    }
                }
            }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            
            
            withAnimation(.spring()) {
                    ExcuseCard(excuseVM: excusesVM).rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0)).gesture(DragGesture(minimumDistance: 20, coordinateSpace: .global)
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
                            excusesVM.getExcuse(category: selectedCategory)
                            }
                        })
                }
            if excusesVM.excuses.count > 0 {
                Button {
                    PersistenceController.saveExcuse(content: excusesVM.excuses.first!.excuse, category: excusesVM.excuses.first!.category)
                    isHidden = true
                } label: {
                    if !PersistenceController.itemExists(excusesVM.excuses.first!.excuse) {
                        SaveExcuse()
                    }
                }.opacity(isHidden ? 0 : 1).padding()
            }
        }.onAppear {
            excusesVM.getExcuse(category: "random")
        }
        
    }
    private func itemExists(_ item: String) -> Bool {
        ExcusesViewModel().itemIsSaved = savedExcuses.contains(where: { $0.cnt == item})
        print(ExcusesViewModel().itemIsSaved)
        return savedExcuses.contains(where: { $0.cnt == item})
        
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ExcuseMO")
//        fetchRequest.predicate = NSPredicate(format: "content == %@", item)
//        return ((try? viewContext.count(for: fetchRequest)) ?? 0) > 0
    }

}

struct DifferentExcusesRegion_Previews: PreviewProvider {
    static var previews: some View {
        DifferentExcusesRegion()
    }
}
