//
//  Activity.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 28.6.22..
//

import Foundation

struct Activity: Hashable, Codable {
    var activity: String
    var type: String
    var participants: Int
}

