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
    
    @State private var filter = ""
    
    @State private var selectedCategory = "random"
        
    @FetchRequest(entity: ExcuseMO.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "cnt", ascending: true)])
    private var savedExcuses: FetchedResults<ExcuseMO>
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        VStack {
            Text("Click on category name to get a new excuse.").foregroundColor(Color(hex: "C6DE41")).font(.subheadline).italic().padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            ScrollView (.horizontal) {
                HStack (alignment: .center, spacing: 5) {
                    ForEach (categoriesViewModel.categories, id: \.self) {
                        category in
                        
                        // CategoryCard(title: category.name)
                        
                        Button(category.name.capitalized) {
                            excusesVM.getExcuse(category: category.name)
                            selectedCategory = category.name
                            withAnimation(.spring()) {
                                self.degrees += 360
                                
                            }
                        }.foregroundColor(Color(hex: "C6DE41")).padding()
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
                        
                    }
                }
            }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            
            if excusesVM.excuses.count > 0 {
                withAnimation(.easeInOut) {
                    ExcuseCard(excuseVM: excusesVM, isSaved: true
                    ).rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0)).gesture(DragGesture(minimumDistance: 20, coordinateSpace: .global)
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
