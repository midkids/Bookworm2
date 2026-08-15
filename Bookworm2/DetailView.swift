//
//  DetailView.swift
//  Bookworm2
//
//  Created by Myron Snelson on 8/14/26.
//

import SwiftData
import SwiftUI

struct DetailView: View {
    let book: Book
    
    // We must use some type of scroll view in
    // order to show all the data no matter how
    // long it is
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                Text(book.genre.uppercased())
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75 ))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            Text(book.review)
                .padding()
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle )
        }
        .navigationTitle("book.title")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    do {
        // This will allow us to write our data in memory
        // rather than storage, and the data will only be
        // stored temporarily
        // IMPORTANT: We must do ALL of the following
        // in order to create a preview
        // when we are using SwiftData
        let config = ModelConfiguration(isStoredInMemoryOnly:  true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test Book", author: "Test Author", genre: "Fantasy", review: "This is a test book", rating: 4)
        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
