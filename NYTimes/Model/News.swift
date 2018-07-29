//
//  News.swift
//  NYTimes
//
//  Created by Sanjay Shingarwad on 12/07/18.
//  Copyright © 2018 Sanjay Shingarwad. All rights reserved.
//

import Foundation

struct News: Decodable {
    
    let url: String?
    let adx_keywords: String?
    let column: String?
    let section: String?
    let byline: String?
    let type: String?
    let title: String?
    let abstract: String?
    let published_date: String?
    let source: String?
    let id: Int?
    let asset_id: Int?
    let imageUrl: String = "https://www.facebook.com/newsworldin/photos/a.1487841691541205.1073741825.1487838061541568/1941681269490576/?type=1&theater"
}





