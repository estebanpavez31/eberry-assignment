//
//  ShowDataSource.swift
//  EberryAssignment
//
//  Data Source of the tv shows array cover by unit testing
//
//  Created by Esteban Pavez on 2020-01-17.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import UIKit

struct ShowDataSource {
    var shows: [Show]
    let numberOfSections = 1

    /// Cover the number of rows in the table view of tv shows
    /// - Parameter section: Current section of table view
    func numberOfRows(inSection section: Int) -> Int {
        guard section == 0 else { return 0 }

        return shows.count
    }

}
