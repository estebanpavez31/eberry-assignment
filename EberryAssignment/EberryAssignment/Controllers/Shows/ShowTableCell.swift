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

        if show.summary != nil {
            Util.setStringWithHTTPFormat(stringHTTP: show.summary, labelToAssignFormat: lblDescriptionShow)
        }

        lblDescriptionShow.textColor = .white

    }
}
