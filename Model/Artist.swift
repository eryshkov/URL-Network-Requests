//
//  Artist.swift
//  URL Network Requests
//
//  Created by Evgeniy Ryshkov on 07/11/2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import Foundation

struct Artist: Codable {
    var artistName: String
    var trackName: String?
    var trackViewUrl: String?
    var collectionHdPrice: Int?
    var artworkUrl30: String?
    var artworkUrl60: String?
    var artworkUrl100: String?
    var longDescription: String?
    var kind: String?
    
}
