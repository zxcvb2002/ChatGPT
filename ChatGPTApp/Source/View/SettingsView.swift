//
//  SettingsView.swift
//  ChatGPTApp
//
//  Created by 드즈 on 2023/06/27.
//

import SwiftUI

struct SettingsView: View {
    @State private var mainLanguage: MainLanguage = .auto_detect
    @Binding var colorScheme: ColorScheme
    @State private var showSubscribe: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Image(systemName: "envelope")
                        Text("Email")
                        Spacer()
                        Text("\(Email.email)")
                            .foregroundColor(.gray)
                    }
                    Button {
                        showSubscribe = true
                    } label: {
                        HStack {
                            Image(systemName: "plus.square")
                            Text("Subscription")
                            Spacer()
                            Text("\(Subscription.free.rawValue)")
                                .foregroundColor(.gray)
                        }
                        .foregroundColor(.black)
                    }
                    Button {
                        showSubscribe = true
                    } label: {
                        HStack {
                            Image(systemName: "arrow.up.square")
                            Text("Upgrade to ChatGPT Plus")
                        }
                    }
                    NavigationLink(destination: DataControlsView()) {
                        HStack {
                            Image(systemName: "gearshape")
                            Text("Data Controls")
                        }
                    }
                } header: {
                    Text("ACCOUNT")
                }
                
                Section {
                    Picker(selection: $colorScheme) {
                        //Text("System").tag(ColorScheme.system)
                        Text("Light").tag(ColorScheme.light)
                        Text("Dark").tag(ColorScheme.dark)
                    } label: {
                        HStack {
                            Image(systemName: "sun.min.fill")
                            Text("Color Scheme")
                        }
                    }
                    HStack {
                        Image(systemName: "water.waves")
                        Text("Haptic Feedback")
                        Spacer()
                        Toggle("", isOn: .constant(false))
                            .opacity(0.5)
                    }
                } header: {
                    Text("APP")
                } footer: {
                    Text("Haptic feedback is currently disabled to conserve you device's battery.")
                }
                
                Section {
                    Picker(selection: $mainLanguage) {
                        ForEach(MainLanguage.allCases, id: \.self) { language in
                            Text(language.rawValue.capitalized).tag(language)
                        }
                    } label: {
                        HStack {
                            Image(systemName: "waveform")
                            Text("Main Language")
                        }
                    }
                } header: {
                    Text("SPEECH")
                } footer: {
                    Text("For best results, select the language you mainly speak. If it's not listed. it may still be supported via auto-detection.")
                }
                
                Section {
                    Button {
                        
                    } label: {
                        HStack {
                            Image(systemName: "questionmark.circle.fill")
                            Text("Help Center")
                        }
                        .foregroundColor(.black)
                    }
                    Button {
                        
                    } label: {
                        HStack {
                            Image(systemName: "newspaper")
                            Text("Terms of Use")
                        }
                        .foregroundColor(.black)
                    }
                    Button {
                        
                    } label: {
                        HStack {
                            Image(systemName: "lock")
                            Text("Privacy Policy")
                        }
                        .foregroundColor(.black)
                    }
                    NavigationLink(destination: LicensesView()) {
                        HStack {
                            Image(systemName: "book.closed.fill")
                            Text("Licenses")
                        }
                    }
                    HStack {
                        Image(systemName: "circle.fill")
                        Text("ChatGPT for iOS")
                        Spacer()
                        Text("\(SettingsModel.initial).\(SettingsModel.year).\(SettingsModel.last) (\(SettingsModel.identifier))")
                            .foregroundColor(.gray)
                    }
                } header: {
                    Text("ABOUT")
                }
                
                Section {
                    Button {
                        
                    } label: {
                        HStack {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                            Text("Sign Out")
                        }
                        .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.grouped)
            .environment(\.colorScheme, colorScheme)
            .sheet(isPresented: $showSubscribe) {
                SubscribeView()
            }
        }
    }
}
