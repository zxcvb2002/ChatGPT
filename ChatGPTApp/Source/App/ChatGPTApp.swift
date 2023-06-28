//
//  ChatGPTApp.swift
//  ChatGPTApp
//
//  Created by 드즈 on 2023/06/09.
//  https://www.youtube.com/watch?v=WNBPFYWuPHo

import SwiftUI

@main
struct ChatGPTApp: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        UITextField.appearance().tintColor = UIColor(named: "ButtonColor")
    }
    
    @State private var colorScheme: ColorScheme = .light // .system
    
    var body: some Scene {
        WindowGroup {
            ChatView(colorScheme: $colorScheme)
                .environment(\.colorScheme, colorScheme)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
