//
//  CategoryViewModel.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 25.6.22..
//

import Foundation

class CategoryViewModel: ObservableObject {
    
    @Published var categories: [Category] = [
        Category(name: "random", systemImage: "questionmark.square"),
        Category(name: "family", systemImage: "house"),
        Category(name: "office", systemImage: "laptopcomputer.and.iphone"),
        Category(name: "party", systemImage: "giftcard"),
        Category(name: "college", systemImage: "book"),
        Category(name: "children", systemImage: "person.2")
    ]
    
}
