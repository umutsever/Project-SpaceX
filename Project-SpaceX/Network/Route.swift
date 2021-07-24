//
//  Route.swift
//  SpaceX-Project
//
//  Created by Umut Sever on 19.07.2021.
//

import Foundation

enum Route {
    static let baseUrl = "https://api.spacexdata.com/v4"
    case upcoming
    case past
    case rocket
    
    var routeDescription: String {
        switch self {
        case .upcoming:
            return "/launches/upcoming"
        case .past:
            return "/launches/past"
        case .rocket:
            return "/rockets"
        }
    }
}
