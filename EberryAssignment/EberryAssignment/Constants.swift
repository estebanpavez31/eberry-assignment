//
//  Constants.swift
//  EberryAssignment
//
//  Class that contains the constants element used in the whole app
//
//  Created by Esteban Pavez on 2020-01-15.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation

struct Constants {

    struct Services {
        // Max time out that will take to call the services in seconds
        static var timeOut = Double(15)
        // HTTP status code of a successful call
        static var statusCodeSuccess = 200
    }

    struct Test {
        // URL to test the call of the places service
        static var urlPlaces = "https://secure.closepayment.com/close-admin/1.0/place/meappid?meAppId=50&records=42"
        // Max time out that will take to call the services
        static var timeOut = Double(5)
    }
}
