//
//  FavouritesListView.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 28.6.22..
//

import SwiftUI
import UIKit

struct FavouritesListView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: ExcuseMO.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "cnt", ascending: true)])
    private var savedExcuses: FetchedResults<ExcuseMO>
    
    
    
    var body: some View {

        ScrollView {
            VStack {
                ForEach (savedExcuses) { exc in
                    FavouritesRow(exc: exc)
                }
            }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
        }

        
    }

}

struct FavouritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesListView()
    }
}
