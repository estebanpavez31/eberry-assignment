//
//  FixtureConstants.swift
//  EberryAssignment
//
//  Created by Esteban Pavez on 2020-01-17.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation

struct FixtureConstants {
    
    struct Show {
        static var name = "Show Name"
        static var officialSite: String = "http://www.google.com"
        static var status: String = "Enabled"
        static var summary: String = "Summary of Show"
        static var rating: ShowRating = ShowRating(average: 8.0)
        static var image: ShowImage = ShowImage(medium: "medium", original: "original")
    }
}
