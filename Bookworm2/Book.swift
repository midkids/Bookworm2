//
//  Book.swift
//  Bookworm2
//
//  Created by Myron Snelson on 8/10/26.
//

import Foundation
import SwiftData // added

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int // 1-5, 5 is best
    
    // Must have an initializer
    // SHORTCUT: simply type "in"
    // and Swift will complete the
    // initializer for you
    init(title: String, author: String, genre: String, review: String, rating: Int) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
    }
}

