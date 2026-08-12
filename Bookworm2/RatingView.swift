//
//  RatingView.swift
//  Bookworm2
//
//  Created by Myron Snelson on 8/11/26.
//
// We will build this RatingView such that
// in can be used in other applications
// To do that, we need to several
// customizeable properties
// For example, you can choose the label
// to appear before the star rating
// with the default being an empty string
// We set a default to 5 stars for the rating
// but this number can be changed to any number
// We will have default off and on star images
// but you could change those
// We will have default off and on colors
// that could be changed

import SwiftUI

struct RatingView: View {
    // The rating variable is defined in the
    // Book.swift file and created in the
    // ContentView. We are @Binding to it
    // here to use that same variable
    // This will allow the rating variable to
    // be changed in the RatingView and update
    // it in the ContentView
    // When the rating is updated here,
    // it writes through the binding back to the
    // parent’s (ContentView) @State. The @State
    // change is what tells SwiftUI the view data
    // changed, so SwiftUI recalculates the
    // affected view bodies.
    
    @Binding var rating: Int
    
    var label = ""
    var maxiumRating = 5
    
    // An optional offImage
    var offImage : Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    
    var body: some View {
        HStack {
            // Displays a rating label
            // if one is provided
            if label.isEmpty == false {
                Text(label)
            }
            ForEach(1..<maxiumRating + 1, id: \.self) { number in
                Button {
                    // IMPORTANT: The following statement
                    // is only executed for one of displayed
                    // buttons if that button is pressed
                    // IMPORTANT: Each Button is created during
                    // a different ForEach iteration, so each
                    // one captures that iteration’s number
                    // value
                    // Therefore, the value of rating is
                    // updated based on the button that
                    // is pressed (e.g. 4th star pressed
                    // sets the value of the @Binding
                    // rating variable to 4)
                    // Here we are exposing a problem in that
                    // SwiftUI is tapping every button for us
                    // That is because SwiftUI makes entire
                    // rows tappable and it is getting confused
                    // print("Tapped: \(number)")
                    rating = number
                } label: {
                // Here we display an image for each of the
                // buttons as we iterate through the ForEach,
                // using the ForEach value of number
                    image(for: number)
                    // Regardless of what image is
                    // displayed, this changes the color
                    // of each image displayed
                    // If number (from the ForEach loop)
                    // is greater than our current rating,
                    // make the image the off color
                    // else make it the on color
                        // changes the color
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
            }
        }
        // Add this modifier will make SwifUI treat
        // each button individually inside the row
        .buttonStyle(.plain)
    }
    
    // The image function will determine
    // which rating image to show, on or off
    // If the number that was passed to us
    // from the ForEach is greater than our
    // current rating (4 in the preview),
    // make the image to be displayed an off Image
    // else make it an on image
    func image(for number: Int) -> Image {
        if number > rating {
            // Here we are using nil coalescing
            // It means if the off image is nil (not
            // provided),use an on image
            // In our case, since an off image
            // was not provided, we will use the
            // on image, a star.fill
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    // We must pass in the @Binding rating
    // to make the preview work
    // Constant binding solves this need easily.
    // These are bindings with fixed values.
    RatingView(rating: .constant(4))
}
