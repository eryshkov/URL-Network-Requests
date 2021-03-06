//
//  Artists.swift
//  URL Network Requests
//
//  Created by Evgeniy Ryshkov on 07/11/2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import Foundation

struct Artists: Codable {
    var resultCount: Int
    var results: [Artist]
}
