//
//  FavouritesView.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 27.6.22..
//

import SwiftUI
import CoreData

struct FavouritesView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: ExcuseMO.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "cnt", ascending: true)])
    private var savedExcuses: FetchedResults<ExcuseMO>
    
    private var contentToDelete: String = ""
    var body: some View {
            ZStack {
                LinearGradient(colors: [Color(hex: "153B44"), Color(hex: "071C21")], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                
                FavouritesListView()
                
                if savedExcuses.count == 0 {
                    withAnimation(.easeInOut) {
                        Text("Favourite excuses list is empty").italic().foregroundColor(.gray)
                    }
                    
                }
                
                
            }
        
        .navigationBarTitle("Favourite excuses", displayMode: .inline)
        
    }
    

}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
