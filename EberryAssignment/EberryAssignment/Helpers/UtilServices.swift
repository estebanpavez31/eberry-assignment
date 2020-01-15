//
//  UtilServices.swift
//  EberryAssignment
//
//  Class with the logic related to the services in the app
//
//  Created by Esteban Pavez on 2020-01-15.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import UIKit

class UtilServices {

    /// Get the list of places with the Place object array
    /// - Parameter onCompletion: Places array with the type Place
    static func getShows(_ showName: String, onCompletion: @escaping (_ shows: [Show]) -> Void) {

        GetShows.sharedInstance.getShows(showName) { (shows: [Show]) in
            DispatchQueue.main.async(execute: {
                onCompletion(shows)
            })
        }
    }

    /// Do the service call of the services checking the status code
    ///
    /// - Parameter request:      request with service call
    /// - Parameter controller:   controller who makes the call
    /// - Parameter onCompletion: response of the service with the json and error
    static func doServiceCall(_ request: NSMutableURLRequest, controller: URLSessionDelegate, onCompletion: @escaping ServiceResponse) {

        // Set timeout for request and getting the resource
        let urlconfig = URLSessionConfiguration.default
        urlconfig.timeoutIntervalForRequest = Constants.Services.timeOut
        urlconfig.timeoutIntervalForResource = Constants.Services.timeOut

        let session = URLSession(configuration: urlconfig, delegate: controller, delegateQueue: nil)

        let task = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard error == nil && data != nil else {

                // check connection error
                Logger.log("Connection error")

                onCompletion(Data(), nil)
                return
            }

            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != Constants.Services.statusCodeSuccess {

                // check status code different than 200
                Logger.log("statusCode = \(httpStatus.statusCode)")
                Logger.log("response = \(String(describing: response))")

                onCompletion(Data(), NSError(domain: "", code: httpStatus.statusCode, userInfo: [:]))
            } else {
                onCompletion(data, nil)
            }
        })
        task.resume()
    }

    /// Do the service call with a get request
    /// - Parameters:
    ///   - path: URL of the service
    ///   - onCompletion: JSON with places
    static func makeHTTPGetRequest(_ controller: URLSessionDelegate, urlComponents: URLComponents,
                                   onCompletion: @escaping ServiceResponse) {

        let request = NSMutableURLRequest(url: urlComponents.url!)

        UtilServices.doServiceCall(request, controller: controller,
                                              onCompletion: { data, err in
                                                onCompletion(data, err)
        })
    }
}
