//
//  ContentView.swift
//  TodoList
//
//  Created by Gagandeep Dass Kaur on 18/3/25.
//

import SwiftUI

struct ContentView: View {
    @State var descriptionNote: String = ""
    @StateObject var notesViewModel = NotesViewModel()
    
    var body: some View {
        VStack {
            Text("Añade una tarea")
                .underline()
                .foregroundColor(.gray)
                .padding(.horizontal, 16)
            TextEditor(text: $descriptionNote)
                .foregroundColor(.gray)
                .frame(height: 100)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.green, lineWidth: 2)
                )
                .padding(.horizontal, 12)
                .cornerRadius(3.0)
            Button("Crear") {
                notesViewModel.saveNote(description: descriptionNote)
                descriptionNote = ""
            }
            .buttonStyle(.bordered)
            .tint(.green)
            Spacer()
        }
        .navigationTitle("TODO")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

#Preview {
    ContentView()
}
