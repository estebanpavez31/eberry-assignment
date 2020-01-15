//
//  GetShows.swift
//  EberryAssignment
//
//  Created by Esteban Pavez on 2020-01-15.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import UIKit

typealias ServiceResponse = (Data?, NSError?) -> Void

class GetShows: NSObject, URLSessionDelegate {
    static let sharedInstance = GetShows()

    /// Call the service via a HTTP GET request and get the json with places
    /// - Parameter onCompletion: JSON with places
    func getShows(_ showName: String, onCompletion: @escaping ([Show]) -> Void) {
        let baseURL = URLServices.urlShows

        var urlComponents = URLComponents(string: baseURL)!

        // Mapping request
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: showName)
        ]

        // Do service call via HTTP Get request
        UtilServices.makeHTTPGetRequest(self, urlComponents: urlComponents,
                                        onCompletion: { data, _ in
                                            onCompletion(self.parsingJSON(data: data))
        })
    }

    /// Parse JSON obtained from service call to transform it to a Show array object
    /// - Parameter data: Data with json response
    func parsingJSON(data: Data?) -> [Show] {
        guard data != nil else {
            return [Show]()
        }

        let decoder = JSONDecoder()

        do {
            let shows = try decoder.decode([ShowsList].self, from: data ?? Data())

            Logger.log("Parsing Shows Succeded")

            var showsFinal = [Show]()
            for showObj in shows {
                showsFinal.append(showObj.show)
            }

            return showsFinal
        } catch {
            Logger.log("Parsing Shows Failed")
            print(error.localizedDescription)

            return [Show]()
        }
    }
}
