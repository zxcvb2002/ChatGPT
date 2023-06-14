//
//  ChatGPTAppApp.swift
//  ChatGPTApp
//
//  Created by 드즈 on 2023/06/09.
//  https://www.youtube.com/watch?v=WNBPFYWuPHo

import SwiftUI

@main
struct ChatGPTAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ChatView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
