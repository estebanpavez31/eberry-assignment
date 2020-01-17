//
//  ShowDetailController.swift
//  EberryAssignment
//
//  Controller with the detail view of the show selected of the list
//
//  Created by Esteban Pavez on 2020-01-16.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import UIKit

class ShowDetailController: UIViewController {

    /// ImageView with the main icon of the show
    @IBOutlet weak var imgIconShow: UIImageView!
    /// ImageView with the number of the rating of the show
    @IBOutlet weak var lblRating: UILabel!
    /// ImageView with the star icon next to the rating
    @IBOutlet weak var imgStarIcon: UIImageView!
    /// Label with the title of the show
    @IBOutlet weak var lblNameShow: UILabel!
    /// Label with the current status of the show
    @IBOutlet weak var lblStatusShow: UILabel!
    /// Label with a summary of the show
    @IBOutlet weak var lblDescriptionShow: UILabel!
    /// Button that open an external browser with the official site of the tv show
    @IBOutlet weak var btnOpenOfficialSite: UIButton!

    /// Objet with the info of the tv show
    var tvShowInfo = Show()

    /// Set the data inside of the cell of the show
    /// - Parameters:
    ///   - show: Object with the info of the show
    ///   - iconShow: UIImage with the icon of the show
    func setData(show: Show, iconShow: UIImage) {
        let fontSizeDescription = CGFloat(17)

        setRating(show: show)

        lblNameShow.text = show.name
        imgIconShow.image = iconShow
        lblStatusShow.text = show.status

        if show.summary != nil {
            Util.setStringWithHTTPFormat(stringHTTP: show.summary, labelToAssignFormat: lblDescriptionShow)
        }

        lblDescriptionShow.textColor = .white
        lblDescriptionShow.textAlignment = .center
        lblDescriptionShow.font = UIFont(name: Constants.Font.rockwell, size: fontSizeDescription)

        if show.officialSite == nil {
            btnOpenOfficialSite.isHidden = true
        }
    }

    /// Check if the rating exists to assign it, if not it hides and center the name of the tv show
    /// - Parameter show: Object with the data of the tv show
    func setRating(show: Show) {
        if show.rating.average == nil {
            lblRating.isHidden = true
            imgStarIcon.isHidden = true
            lblNameShow.center.x = self.view.center.x
        } else {
            lblRating.text = String(show.rating.average)
        }
    }

    /// Open the official website of the tv show in a external browser
    /// - Parameter sender: Button that realizes the action
    @IBAction func openOfficialWebsite(_ sender: Any) {
        Util.openWebPage(url: tvShowInfo.officialSite)
    }
}
