//
//  SettingsModel.swift
//  ChatGPTApp
//
//  Created by 드즈 on 2023/06/28.
//

import Foundation

struct Email {
    static let email = ""
}

struct SettingsModel {
    static let initial = "1"
    static let year = "2023"
    static let last = "159"
    static let identifier = "986"
}

enum Subscription: String {
    case free = "Free Plan"
    case premium = "ChatGPT Plus"
}

enum MainLanguage: String, CaseIterable {
    case auto_detect = "Auto-Detect"
    case arabic = "Arabic"
    case bosnian = "Bosnian"
    case bulgarian = "Bulgarian"
    case catalan = "Catalan"
    case chinese = "Chinese"
    case croatian = "Croatian"
    case czech = "Czech"
    case danish = "Danish"
    case dutch = "Dutch"
    case english = "English"
    case finnish = "Finnish"
    case galician = "Galician"
    case german = "German"
    case greek = "Greek"
    case hindi = "Hindi"
    case hungarian = "Hungarian"
    case indonesian = "Indonesian"
    case italian = "Italian"
    case japanese = "Japanese"
    case korean = "Korean"
    case macedonian = "Macedonian"
    case malay = "Malay"
    case norwegian = "Norwegian"
    case polish = "Polish"
    case portuguese = "Portuguese"
    case romanian = "Romanian"
    case russian = "Russian"
    case slovak = "Slovak"
    case swedish = "Swedish"
    case tagalog = "Tagalog"
    case tamil = "Tamil"
    case thai = "Thai"
    case turkish = "Turkish"
    case ukrainian = "Ukrainian"
    case vietnamese = "Vietnamese"
}
