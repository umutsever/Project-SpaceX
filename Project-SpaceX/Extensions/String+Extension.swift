//
//  String+Extension.swift
//  Project-SpaceX
//
//  Created by Umut Sever on 21.07.2021.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }

    
}

