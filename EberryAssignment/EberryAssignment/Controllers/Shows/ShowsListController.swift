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

class ShowsListController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    /// Text field where the user type the numbrer of a show
    @IBOutlet weak var txtFieldSearch: UITextField!
    /// Table view where the tv shows are listed
    @IBOutlet weak var tableViewShows: UITableView!
    /// View with the loading screen and info
    @IBOutlet weak var viewLoading: UIView!
    /// Label with info of the search and loading message
    @IBOutlet weak var lblInfoSearch: UILabel!
    /// Activity indicator inside loading view
    @IBOutlet weak var activityIndicatorSearch: UIActivityIndicatorView!
    
    /// List of objects with the tv shows
    var showsList = [Show]()
    /// List of the images of the tv shows related, if there are no images related there is an empty UIImage
    var showsListImages = [UIImage]()
    /// DataSource to get the data cover by unit tests
    var showDataSource = ShowDataSource(shows: [Show]())

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    /// Do the service call with the search input by the user to get the tv shows
    /// - Parameter showName: Name of the tv show that the user typed
    func searchTVShows(showName: String) {

        showLoadingScreen()

        UtilServices.getShows(showName) { shows in
            self.activityIndicatorSearch.isHidden = true
            self.verifyTvShows(shows: shows)
        }
    }

    /// Verifies if the array with shows has any, if not it shows the loading screen with a proper message
    /// - Parameter shows: Array with tv shows obtained from the service
    func verifyTvShows(shows: [Show]) {
        if shows.count > 0 {
            showDataSource.shows = shows
            viewLoading.isHidden = true
            showsList = shows
            cachingImages()
            tableViewShows.reloadData()
        } else {
            viewLoading.isHidden = false
            lblInfoSearch.text = NSLocalizedString("shows_not_found", comment: "message when no shows are found")
        }
    }

    /// Show the view with the loading message
    func showLoadingScreen() {
        viewLoading.isHidden = false
        lblInfoSearch.text = NSLocalizedString("loading_shows", comment: "Loading message while searching tv shows")
        activityIndicatorSearch.isHidden = false
    }

    /// Sets the amount of shows that it will be desplayed in the table view
    /// - Parameters:
    ///   - tableView: TableView with tv shows
    ///   - section: Current section of the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showDataSource.numberOfRows(inSection: section)
    }

    /// Sets the data in the table view cell of the tv show
    /// - Parameters:
    ///   - tableView: TableView with tv show
    ///   - indexPath: Indexpath with indexes of section and row of the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellShow = tableView.dequeueReusableCell(withIdentifier: "showTableCell")! as? ShowTableCell

        guard cellShow != nil else {
            return UITableViewCell()
        }

        cellShow?.setData(show: showsList[indexPath.row], iconShow: showsListImages[indexPath.row])

        return cellShow!
    }

    /// Defines the action to do when a cell is tapped
    /// - Parameters:
    ///   - tableView: Tableview of products
    ///   - indexPath: Indexpath with the current row and section indexes
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let showDetailController = storyBoard.instantiateViewController(withIdentifier: "showDetailController") as? ShowDetailController

        guard showDetailController != nil else {
            return
        }

        showDetailController?.tvShowInfo = showsList[indexPath.row]

        self.present(showDetailController!, animated: true, completion: nil)

        showDetailController?.setData(show: showsList[indexPath.row], iconShow: showsListImages[indexPath.row])
    }

    /// Creates an array of the icons in memory from the URL si it does not load everytime when the user scrolls
    func cachingImages() {

        Logger.log("Starting the caching of icons")

        showsListImages.removeAll()

        for show in showsList {
            if show.image != nil {
                let urlImageDefault = show.image.medium.replacingOccurrences(of: "http", with: "https")
                let imageURL = URL(string: urlImageDefault) ?? URL(fileURLWithPath: "")

                // Set image from URL
                let imageData = try? Data(contentsOf: imageURL)
                if let imageData = imageData {
                    // Appends the Icon to the array with the rest of Images
                    showsListImages.append(UIImage(data: imageData) ?? UIImage())
                }
            } else {
                // In the case that there is no image associated with the show it adds an empty image
                showsListImages.append(UIImage())
            }
        }

        Logger.log("Caching of icons finished")
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
