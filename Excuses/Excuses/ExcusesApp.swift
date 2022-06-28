//
//  ExcusesApp.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 24.6.22..
//

import SwiftUI

@main
struct ExcusesApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
                .environment(\.managedObjectContext,
                                             persistenceController.container.viewContext)
                

        }
    }
}
