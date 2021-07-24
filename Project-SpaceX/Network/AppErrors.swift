//
//  AppErrors.swift
//  SpaceX-Project
//
//  Created by Umut Sever on 19.07.2021.
//

import Foundation

enum AppError: LocalizedError {
    case errorDecoding
    case unknown
    case invalidUrl
    case serverErrors(String)
    
    var errorDescription: String? {
        switch self{
        case .errorDecoding:
            return "Decoding Error"
        case .unknown:
            return "Unknown Error"
        case .invalidUrl:
            return "Invalid URL"
        case .serverErrors(let error):
            return error
        }
    }
}
