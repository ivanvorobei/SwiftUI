//
//  NoteRow.swift
//  SwiftUINote
//
//  Created by chanju Jeon on 05/06/2019.
//  Copyright © 2019 we'd. All rights reserved.
//

import SwiftUI

struct NoteRow : View {
    var note: Note
    
    var body: some View {
        HStack {
            Text(note.text)
        }
    }
}

#if DEBUG
struct NoteRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            NoteRow(note: Note(text: "New Note"))
            NoteRow(note: Note(text: "Another Note"))
        }
        .previewLayout(.fixed(width: 300, height: 50))
    }
}
#endif
