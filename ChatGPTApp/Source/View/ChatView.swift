//
//  ContentView.swift
//  ChatGPTApp
//
//  Created by 드즈 on 2023/06/09.
//

import Foundation
import SwiftUI
import CoreData

struct ChatView: View {
    @ObservedObject var viewModel = ViewModel()
    @FocusState var textFieldIsFocused: Bool
    @State private var showHistoryView = false
    @State private var showSettingsView = false
    @Binding var colorScheme: ColorScheme
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    ForEach(viewModel.messages.filter({$0.role != .system}), id: \.id) { message in
                        HStack {
                            // Spacer()
                            if message.role == .user {
                                Image("User")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .cornerRadius(20)
                                
                            } else {
                                ZStack {
                                    Circle()
                                        .frame(width: 25, height : 25)
                                        .foregroundColor(.assistantColor)
                                    Image("Assistant")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                }
                            }
                            Text(message.content)
                                .padding()
                                .foregroundColor(Color.primary)
                            Spacer()
                        }
                        .padding()
                    }
                }
                .padding(.vertical)
                
                HStack {
                    TextField("Message", text: $viewModel.currentInput)
                        .padding(9.5)
                        .focused($textFieldIsFocused)
                        .background(
                            Group {
                                if textFieldIsFocused {
                                    RoundedRectangle(cornerRadius: 23.5)
                                        .stroke(textFieldIsFocused ? .gray : .clear)
                                        .opacity(textFieldIsFocused ? 0.5 : 0)
                                } else {
                                    RoundedRectangle(cornerRadius: 23.5)
                                        .foregroundColor(textFieldIsFocused ? .clear : .backgroundColor)
                                }
                            }
                        )
                    
                    ZStack {
                        Button {
                            viewModel.sendMessage()
                        } label: {
                            Circle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.buttonColor)
                        }
                        .opacity(viewModel.currentInput == "" ? 0.5 : 1)
                        Image(systemName: "arrow.up")
                            .foregroundColor(.systemColor)
                            .bold()
                            .opacity(viewModel.currentInput == "" ? 0.5 : 1)
                    }
                }
                .padding()
            }
            .environment(\.colorScheme, colorScheme)
            .onAppear(perform: UIApplication.shared.hideKeyboard)
            .animation(.easeIn(duration: 0.275))
            .sheet(isPresented: $showHistoryView) {
                HistoryView()
                    .presentationDetents([.medium, .height(420)])
            }
            .sheet(isPresented: $showSettingsView) {
                SettingsView(colorScheme: $colorScheme)
            }

            Menu {
                Button {
                    showHistoryView = true
                } label: {
                    Label("History", systemImage: "clock")
                }
                
                Button {
                    showSettingsView = true
                } label: {
                    Label("Settings", systemImage: "gearshape.fill")
                }
                
                Divider()
                
                Button {
                    
                } label: {
                    Label("New chat", systemImage: "plus")
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 55, height: 55)
                        .foregroundColor(.backgroundColor)
                        //.opacity(0.1)
                    Image(systemName: "ellipsis")
                        .foregroundColor(.metsysColor)
                }
            }
            .position(x: 350, y: 30)
        }
    }
}
