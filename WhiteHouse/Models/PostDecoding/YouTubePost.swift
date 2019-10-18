//
//  YouTubePost.swift
//  WhiteHouse
//
//  Created by Jared Warren on 10/15/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import Foundation

struct YouTubeTopObject: Decodable {
    
    // can also grab "totalResults". no more than 50 results can be fetched in a single GET. for bigger channels, we may need to drill into the "pageInfo"
    let items: [YTVideoObject]
    
    struct YTVideoObject: Decodable {
        
        let snippet: YTVideoObjectSnippet
        
        struct YTVideoObjectSnippet: Decodable {
            
            let title: String
            let description: String?
            let publishedAt: String
            let thumbnails: YTThumbnailParentObject
            let resourceId: YTVideoResourceIDObject
            
            struct YTThumbnailParentObject: Decodable {
                
                let defaultres: YTTumbnailChildObject
                let medium: YTTumbnailChildObject
                let high: YTTumbnailChildObject
                let standard: YTTumbnailChildObject?
                let maxres: YTTumbnailChildObject?
                
                struct YTTumbnailChildObject: Decodable {
                    let url: URL
                    let width: Int
                    let height: Int
                }
                
                enum CodingKeys: String, CodingKey {
                    case defaultres = "default"
                    case medium, standard, high, maxres
                }
            }
            
            struct YTVideoResourceIDObject: Decodable {
                let videoId: String
            }
        }
        
    }
}
