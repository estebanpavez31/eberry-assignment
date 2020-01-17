//
//  Show.swift
//  EberryAssignment
//
//  Model Class to parse the whole json of list shows searched
//
//  Created by Esteban Pavez on 2020-01-15.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation

struct ShowsList: Decodable {
    var score: Double!
    var show: Show!
}
