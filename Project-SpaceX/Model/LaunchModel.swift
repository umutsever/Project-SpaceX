//
//  LaunchModel.swift
//  Project-SpaceX
//
//  Created by Umut Sever on 23.07.2021.
//

import Foundation

struct LaunchModel: Codable {
    var name: String
    var details: String?
    var links: Patch
    var success: Bool?
    var date_utc: String
    
}

struct Patch: Codable {
    var patch: Patches
}

struct Patches: Codable {
    var small: String?
}
