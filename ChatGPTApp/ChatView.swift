//
//  ContentView.swift
//  ChatGPTApp
//
//  Created by 드즈 on 2023/06/09.
//

import SwiftUI
import CoreData

struct ChatView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.messages.filter({$0.role != .system}), id: \.id) { message in
                    messageView(message: message)
                        .foregroundColor(.white)
                }
            }
            HStack {
                TextField("Message", text: $viewModel.currentInput)
                    .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    //.background(.gray.opacity(0.2))
                    //.cornerRadius(15)
                
                Button {
                    viewModel.sendMessage()
                } label: {
                    Circle()
                        .foregroundColor(.blue)
                        .frame(width: 33, height: 33)
                        .overlay(
                            Image(systemName: "arrow.up")
                                .foregroundColor(.white)
                        )
                }

            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .padding()
        //.background(.color)
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func messageView(message: Message) -> some View {
        HStack {
            if message.role == .user { Spacer() }
            Text(message.content)
                .padding()
                //.background(message.role == .user ? Color.color : Color.color.opacity(value))
                .foregroundColor(Color.primary)
            if message.role == .assistant { Spacer() }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
