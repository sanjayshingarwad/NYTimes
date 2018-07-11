//
//  EndPoint.swift
//  NYTimes
//
//  Created by Sanjay Shingarwad on 12/07/18.
//  Copyright © 2018 Sanjay Shingarwad. All rights reserved.
//

import Foundation

protocol Endpoint {

    var base: String { get }
    var path: String { get }
}

extension Endpoint {

    var apiKey: String {
        return "api-key=3d7ed6dd8a7a4005b5d4a690327e146f"
    }

    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.query = apiKey
        return components
    }

    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

enum NewsFeed {
    case topRated
}

extension NewsFeed: Endpoint {

    var base: String {
        return "https://api.nytimes.com"
    }

    var path: String {
        switch self {
        case .topRated: return "/svc/mostpopular/v2/mostviewed/all-sections/7.json"
        }
    }
}
