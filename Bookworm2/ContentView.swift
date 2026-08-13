//
//  ContentView.swift
//  Bookworm2
//
//  Created by Myron Snelson on 8/10/26.
//
// Creating books with SwiftData
// Adding a custom star rating component
// Building a list with @Query

import SwiftData // added
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query var books: [Book]
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack{
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
