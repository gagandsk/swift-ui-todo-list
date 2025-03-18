//
//  NotesViewModel.swift
//  TodoList
//
//  Created by Gagandeep Dass Kaur on 18/3/25.
//

import Foundation

class NotesViewModel: ObservableObject {
    //Siempre que utilizemos el '@Published' debemos poner el 'ObservableObject'
    @Published var notes: [NoteModel] = []
    
    func saveNote(description: String){
        let newNote = NoteModel(description: description)
        notes.insert(newNote, at: 0)
        encodeAndSaveAllNotes()
    }
    
    private func encodeAndSaveAllNotes() {
        if let encode = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(encode, forKey: "notes")
        }
    }
    
    func getAllNotes() -> [NoteModel] {
        if let notesData = UserDefaults.standard.object(forKey: "notes") as? Data {
            if let notes = try? JSONDecoder().decode([NoteModel].self, from: notesData) {
                return notes
            }
        }
        return []
    }
}
