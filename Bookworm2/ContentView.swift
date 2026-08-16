//
//  ContentView.swift
//  Bookworm2
//
//  Created by Myron Snelson on 8/10/26.
//
// Creating books with SwiftData
// Adding a custom star rating component
// Building a list with @Query
// Showing book details
// Sorting SwiftData queries using SortDescriptor

import SwiftData // added
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    // When you use Query to pull data out of
    // SwiftData, you can sort it
    // IMPORTANT: Choose some logical order
    // to provide the user a predictable experience
    // by having a predictable sort order
    // every time they use the app
    // Query has two options: 1) simple with only
    // one sort field, and 2) an advance option
    // that allows an array of a new type called
    // assort
    
    // 1) Simple versions
    // @Query(sort: \Book.title) var books: [Book]
    // @Query(sort: \Book.rating, order: .reverse) var books: [Book]
    
    // 2) Advanced version
    @Query(sort: [SortDescriptor(\Book.title),
                  SortDescriptor(\Book.author)
    ]) var books: [Book]
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack{
            // This count is just a placeholder until
            // we create our DetailView
            // Text("Count is \(books.count)")
            List {
                ForEach(books) {book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    
                }
                
            }
            .navigationTitle("Bookworm")
            .navigationDestination(for: Book.self) {
                book in DetailView(book: book)
            }
            .toolbar{
                // Make button to ToolBarItem to enable
                // placing it to the far right in preparation
                // for another button on the far left
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Book", systemImage: "plus") {
                        showingAddScreen.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
