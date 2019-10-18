//
//  PostError.swift
//  WhiteHouse
//
//  Created by Jared Warren on 10/16/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import Foundation

enum PostError: Error {
    
    case invalidURL(SocialMedia)
    case appleError(Error)
    case noData(SocialMedia)
    case unableToDecodeImage
    
    var localizedDescription: String {
        switch self {
        case .invalidURL(let socialMedia):
            return "We were unable to reach \(socialMedia.rawValue). Please contact support with error code 0."
        case .appleError(let error):
            return "\(error.localizedDescription) Please contact support with error code 1."
        case .noData(let socialMedia):
            return "\(socialMedia.rawValue) returned with no data. Please contact support with error code 2."
        case .unableToDecodeImage:
            return "Error decoding image. Please contact support with error code 3."
        }
    }
}
