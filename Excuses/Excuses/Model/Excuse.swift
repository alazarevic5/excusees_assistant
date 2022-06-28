//
//  Excuse.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 25.6.22..
//

import Foundation

struct Excuse: Identifiable, Codable {
    var id: Int
    var excuse: String
    var category: String
}

struct DevExcuse: Identifiable, Codable {
    var id: String
    var text: String
}

struct DesignerExcuse: Identifiable, Codable {
    var id: Int
    var excuse: String
    var category: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case excuse = "Excuse"
        case category = "Tag"
    }
}
