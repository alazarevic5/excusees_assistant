//
//  ContentView.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 24.6.22..
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var categoriesViewModel =  CategoryViewModel()
    
    var body: some View {
        NavigationView {

        ZStack {
            LinearGradient(colors: [Color(hex: "153B44"), Color(hex: "071C21")], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            ScrollView {
                VStack (alignment: .center, spacing: 10) {
                    StopView()
                    HStack (spacing: 10) {
                        NavigationLink(destination: DesignerExcuseView()) {
                            ExcusesButton(title: "Designer excuses", imageName: "art").frame(minWidth: 0, maxWidth: .infinity)
                        }
                        
                        NavigationLink(destination: DevExcuseView()) {
                            ExcusesButton(title: "Developer excuses", imageName: "dev").frame(minWidth: 0, maxWidth: .infinity)
                        }
                    }
//                    Categories()
                    CategoriesNew()
                    

                    Divider().frame(height: 3.0).background(Color(hex: "2D6E7E")).padding(EdgeInsets(top: 10, leading: 10, bottom: 20, trailing: 10))
                    NavigationLink(destination: FavouritesView()) {
                        FavExcuseButton(title: "Favourite excuses", imageName: "star").frame(minWidth: 0, maxWidth: .infinity)
                    }
                    Spacer()
                }
            }
        }
        .navigationTitle("").navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
