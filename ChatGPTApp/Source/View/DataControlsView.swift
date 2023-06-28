//
//  DataControlsView.swift
//  ChatGPTApp
//
//  Created by 드즈 on 2023/06/28.
//

import SwiftUI

struct DataControlsView: View {
    @State private var isOn = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Toggle(isOn: $isOn) {
                        Text("Chat History & Training")
                    }
                } footer: {
                    Text("Save new chats on this device to your history and allow them to be used to improve our models. Unsaved chats will be deleted from our systems within 30 days. This setting does not sync across devices. [Learn more](https://help.openai.com/en/articles/7730893-data-controls-faq)")
                }
                
                Section {
                    Button {
                        
                    } label: {
                        Text("Clear Chat History")
                            .foregroundColor(.red)
                    }
                }
                
                Section {
                    Button {
                        
                    } label: {
                        Text("Export Data")
                            .foregroundColor(.black)
                    }
                    Button {
                        
                    } label: {
                        Text("Delete Account")
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Data Controls")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.grouped)
        }
    }
}

struct DataControlsView_Previews: PreviewProvider {
    static var previews: some View {
        DataControlsView()
    }
}
