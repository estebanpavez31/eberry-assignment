//
//  Show.swift
//  EberryAssignment
//
//  Model Class with the information of a single show
//
//  Created by Esteban Pavez on 2020-01-15.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation

struct Show: Decodable {
    var name: String!
    var officialSite: String!
    var status: String!
    var summary: String!
    var rating: ShowRating!
    var image: ShowImage!
}
