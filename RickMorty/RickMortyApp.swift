//
//  RickMortyApp.swift
//  RickMorty
//
//  Created by andrea viana aparisi on 23/4/25.
//

import SwiftUI

@main
struct RickMortyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
