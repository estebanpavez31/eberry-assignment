//
//  Show.swift
//  EberryAssignment
//
//  Model Class with information of shows
//
//  Created by Esteban Pavez on 2020-01-15.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation

struct Shows: Decodable {
    var score: Double!
    var show: Show!
}

struct Show: Decodable {
    var name: String!
    var officialSite: String!
    var status: String!
    var summary: String!
    var image: ShowImage!
}

struct ShowImage: Decodable {
    var medium: String!
    var original: String!
}

