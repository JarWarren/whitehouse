//
//  TwitterPost.swift
//  WhiteHouse
//
//  Created by Jared Warren on 10/15/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import Foundation

// Comes from Twitter as an array. [TwitterObject].self
struct TwitterObject: Decodable {
    
    let createdAt: String // date
    let fullText: String // subtitle
    let user: TwitterUserObject
    let id: Int // id
    
    struct TwitterUserObject: Decodable {
        let name: String // title
        let profileImageUrlHttps: URL // thumbnailURL
    }
    
}
