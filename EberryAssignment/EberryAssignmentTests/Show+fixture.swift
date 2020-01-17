//
//  Show+fixture.swift
//  EberryAssignmentTests
//
//  Created by Esteban Pavez on 2020-01-17.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation
import XCTest

@testable import EberryAssignment

extension Show {

    static func fixture(name: String = FixtureConstants.Show.name,
                        officialSite: String = FixtureConstants.Show.officialSite,
                        status: String = FixtureConstants.Show.status,
                        summary: String = FixtureConstants.Show.summary,
                        rating: ShowRating = FixtureConstants.Show.rating,
                        image: ShowImage = FixtureConstants.Show.image) -> Show {
        return Show(name: name,
                    officialSite: officialSite,
                    status: status,
                    summary: summary,
                    rating: rating,
                    image: image)
    }
}
