//
//  TodoList.swift
//  TodoList
//
//  Created by Gagandeep Dass Kaur on 18/3/25.
//

import Foundation

struct NoteModel: Codable {
    let id: String
    var isFavorite: Bool
    let description: String
    
    init(id: String = UUID().uuidString, isFavorite: Bool = false, description: String) {
        self.id = id
        self.isFavorite = isFavorite
        self.description = description
    }
}
