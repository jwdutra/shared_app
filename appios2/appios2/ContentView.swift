//
//  ContentView.swift
//  appios2
//
//  Created by José Walter on 27/10/23.
//

import SwiftUI
import UIKit



struct ContentView: View {
    @State private var text: String = ""
    @State private var buttonText  = "Lê texto do clipboard"
    private let pasteboard = UIPasteboard.general
    
    var body: some View {
        VStack {
            TextField("Texto lido do clipboard", text: $text)
                .textFieldStyle(.roundedBorder)
            
            HStack {
                Button {
                    paste()
                } label: {
                    Label(buttonText, systemImage: "doc.on.doc.fill")
                }
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                Spacer()
                Button {
                    clear()
                } label: {
                    Label("Limpar", systemImage: "doc.on.clipboard")
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
    
    func paste(){
        if let string = pasteboard.string {
             text = string
        }
    }
    
    func clear(){
        text = "";
    }

    func copyToClipboard() {
        pasteboard.string = self.text
        
        self.buttonText = "Lido!"
        self.text = ""
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.buttonText = ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
