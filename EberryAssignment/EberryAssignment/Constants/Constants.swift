//
//  Constants.swift
//  EberryAssignment
//
//  Class that contains the constants elements used in the whole app
//
//  Created by Esteban Pavez on 2020-01-15.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation

struct Constants {

    struct Font {
        // Font for rockwell type
        static var rockwell = "Rockwell"
    }

    struct Services {
        // Max time out that will take to call the services in seconds
        static var timeOut = Double(15)
        // HTTP status code of a successful call
        static var statusCodeSuccess = 200
    }

}
