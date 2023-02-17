//
//  Fitness_walking_tracksApp.swift
//  Fitness-walking-tracks
//
//  Created by Man Ho Ching on 17/2/2023.
//

import SwiftUI
import Firebase

@main
struct Fitness_walking_tracksApp: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
