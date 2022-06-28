//
//  CategoryViewModel.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 25.6.22..
//

import Foundation

class CategoryViewModel: ObservableObject {
    
    @Published var categories: [Category] = [
        Category(name: "random"),
        Category(name: "family"),
        Category(name: "office"),
        Category(name: "party"),
        Category(name: "college"),
        Category(name: "children")
    ]
    
}
