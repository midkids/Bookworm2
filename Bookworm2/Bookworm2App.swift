//
//  Bookworm2App.swift
//  Bookworm2
//
//  Created by Myron Snelson on 8/10/26.
//

import SwiftData // added
import SwiftUI

@main
struct Bookworm2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
