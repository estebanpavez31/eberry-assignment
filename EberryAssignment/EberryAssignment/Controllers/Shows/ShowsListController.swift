//
//  ShowsListController.swift
//  EberryAssignment
//
//  Controller who has the list of all the shows that are being shearched by the user
//
//  Created by Esteban Pavez on 2020-01-15.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import UIKit

class ShowsListController: UIViewController {

    /// Text field where the user type the numbrer of a show
    @IBOutlet weak var txtFieldSearch: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    /// Do the service call with the search input by the user to get the tv shows
    /// - Parameter showName: Name of the tv show that the user typed
    func searchTVShows(showName: String) {

        UtilServices.getShows(showName) { shows in

        }
    }

    /// Action of the search button with the text field
    /// - Parameter sender: sender who realizes the action
    @IBAction func searchShows(_ sender: Any) {

        let showSearchInput = txtFieldSearch.text

        if showSearchInput != "" {
            searchTVShows(showName: showSearchInput ?? "")
        }
    }
}
