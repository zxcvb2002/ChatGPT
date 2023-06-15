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
            // 기본 accentColor 설정
            UITextField.appearance().tintColor = UIColor(named: "ButtonColor")
        }

    var body: some Scene {
        WindowGroup {
            ChatView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
