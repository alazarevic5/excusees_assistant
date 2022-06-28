//
//  FavouritesRow.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 27.6.22..
//

import SwiftUI

struct FavouritesRow: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var exc: FetchedResults<ExcuseMO>.Element
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(exc.cnt ?? "---").font(.body).bold().padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)) .fixedSize(horizontal: false, vertical: true)
                Text("Category: \(exc.category ?? "---")").font(.caption).padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            }
            Spacer()
            Button {
                print("Delete")
                viewContext.delete(exc)
                do {
                    try viewContext.save()
                }
                catch {
                    print("error...")
                }
            } label: {
                Image(systemName: "trash").frame(width: 50, height: 50).tint(.red)
            }
            
        }.padding().background(.thickMaterial).cornerRadius(20)
        
    }
}

struct FavouritesRow_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesRow(exc: FetchedResults<ExcuseMO>.Element())
    }
}
