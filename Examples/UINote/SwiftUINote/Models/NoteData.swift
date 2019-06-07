//
//  NoteData.swift
//  SwiftUINote
//
//  Created by chanju Jeon on 05/06/2019.
//  Copyright © 2019 we'd. All rights reserved.
//

import SwiftUI

class NoteData {
    
    static let shared = NoteData()
    
    var notes: [Note] = [
        Note(text: "New Note"),
        Note(text: "Another Note")
    ]
    
    private init() { load() }
    
    static func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    func save() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(notes), forKey: "notes")
        debugPrint("save called")
    }
    
    func load() {
        if let data = UserDefaults.standard.object(forKey: "notes") as? Data {
            self.notes = try! PropertyListDecoder().decode([Note].self, from: data)
        }
    }
}
