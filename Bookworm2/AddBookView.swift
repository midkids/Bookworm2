//
//  AddBookView.swift
//  Bookworm2
//
//  Created by Myron Snelson on 8/10/26.
//

import SwiftData // added
import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var rating = 3
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of Book", text: $title)
                    TextField("Name of Author", text: $author)
                    
                    Picker ("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                // We use a separate section here because
                // section allows us to create a title
                // for our TextEditor, making it clear
                // to the user what the TextEditor
                // field is for
                Section("Write a review") {
                    TextEditor(text: $review)
                    
                    //Picker("Rating", selection: $rating) {
                    //    ForEach(0..<6) {
                    //        Text(String("\($0)"))
                    //    }
                    // Replaced this picker with a call to
                    // the RatingView
                    // Our RatingView is MUCH easier for
                    // the user
                    RatingView(rating: $rating)
                }
            Section {
                Button("Save") {
                    let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                    // Insert to modelContext to save it
                    modelContext.insert(newBook)
                    dismiss()
                }
            }
        }
            .navigationTitle("Add Book")
        }
        
    }
}

#Preview {
    AddBookView()
}
