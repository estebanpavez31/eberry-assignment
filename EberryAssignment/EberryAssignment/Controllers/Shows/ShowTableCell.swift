//
//  ShowTableCell.swift
//  EberryAssignment
//
//  Table view cell of the design of a tv show
//
//  Created by Esteban Pavez on 2020-01-15.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import UIKit

class ShowTableCell: UITableViewCell {

    /// Label with the name of the show
    @IBOutlet weak var lblNameShow: UILabel!
    /// Label with the description of the show
    @IBOutlet weak var lblDescriptionShow: UILabel!
    /// ImageView with the icon of the show
    @IBOutlet weak var imgIconShow: UIImageView!

    /// Set the data inside of the cell of the show
    /// - Parameters:
    ///   - show: Object with the info of the show
    ///   - iconShow: UIImage with the icon of the show
    func setData(show: Show, iconShow: UIImage) {
        lblNameShow.text = show.name
        imgIconShow.image = iconShow

        // Sets the string with the description to show it with the format of HTML
        let htmlString = show.summary
        let data = htmlString!.data(using: String.Encoding.unicode)!

        do {
            let attrStr = try NSAttributedString(
                data: data,
                options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
                documentAttributes: nil)
            lblDescriptionShow.attributedText = attrStr
        } catch {
            lblDescriptionShow.isHidden = true
        }

        lblDescriptionShow.textColor = .white
    }
}
