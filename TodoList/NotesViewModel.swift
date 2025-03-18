//
//  NotesViewModel.swift
//  TodoList
//
//  Created by Gagandeep Dass Kaur on 18/3/25.
//

import Foundation
import SwiftUI

class NotesViewModel: ObservableObject {
    //Siempre que utilizemos el '@Published' debemos poner el 'ObservableObject'
    @Published var notes: [NoteModel] = []
    
    init(){
        notes = getAllNotes()
    }
    
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
    
    func removeNote(withId id: String) {
        notes.removeAll(where: { $0.id == id })
        encodeAndSaveAllNotes()
    }
    
    func updateFavoriteNote(note: Binding<NoteModel>) {
        note.wrappedValue.isFavorite = !note.wrappedValue.isFavorite
        encodeAndSaveAllNotes()
    }
}
