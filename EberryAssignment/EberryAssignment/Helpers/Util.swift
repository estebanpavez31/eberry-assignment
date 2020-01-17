//
//  Util.swift
//  EberryAssignment
//
//  Class with general functions to use in the applications
//
//  Created by Esteban Pavez on 2020-01-16.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import UIKit

struct Util {

    /// Open URL in an external browser
    ///
    /// - Parameter url: String with url of web page
    static func openWebPage(url: String) {

        if let urlBrowser = URL(string: url) {

            if UIApplication.shared.canOpenURL(urlBrowser) {

                UIApplication.shared.open(urlBrowser, options: [:], completionHandler: nil)

                Logger.log("The web page has been loaded correctly")
            } else {
                Logger.log("There's been a problem loading web page")
            }
        }
    }

    /// Defines the attributed string with HTML format and assign it to the label send by parameter
    /// - Parameters:
    ///   - stringHTTP: String with HTML tags
    ///   - labelToAssignFormat: Label to assign the attributed string
    static func setStringWithHTTPFormat(stringHTTP: String, labelToAssignFormat: UILabel) {

        let htmlString = stringHTTP
        let data = htmlString.data(using: String.Encoding.unicode)!

        do {
            let attributeString = try NSAttributedString(
                data: data,
                options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
                documentAttributes: nil)
            labelToAssignFormat.attributedText = attributeString
        } catch {
            Logger.log("There's been a problem formating label")
        }
    }
}
