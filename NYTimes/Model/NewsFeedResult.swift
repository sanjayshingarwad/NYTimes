//
//  NewsFeed.swift
//  NYTimes
//
//  Created by Sanjay Shingarwad on 12/07/18.
//  Copyright © 2018 Sanjay Shingarwad. All rights reserved.
//

import Foundation

struct NewsFeedResult: Decodable {
    let results: [News]?
}
