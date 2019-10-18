//
//  SocialMedia.swift
//  WhiteHouse
//
//  Created by Jared Warren on 10/15/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import Foundation

/// Houses API information for each source of social media.
enum SocialMedia: String {
    case youtube = "YouTube"
    case twitter = "Twitter"
    case facebook = "Facebook"
    case instagram = "Instagram"
    
    var baseURL: URL? {
        switch self {
        case .youtube:
            return URL(string: "https://www.googleapis.com/youtube/v3/playlistItems")
        case .twitter:
            return URL(string: "https://api.twitter.com/1.1/statuses/user_timeline.json")
        case .facebook:
            return nil
        case .instagram:
            return nil
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .youtube:
            let maxResultsItem = URLQueryItem(name: "maxResults", value: "50") // how many videos we want to receive. cant be more than 50
            let partItem = URLQueryItem(name: "part", value: "snippet") // which info we want with the video. "snippet" contains everything we need
            let apiKeyItem = URLQueryItem(name: "key", value: plistValue(for: "YouTubeAPIKey"))
            let playlistIDItem = URLQueryItem(name: "playlistId", value: "UUYxRlFDqcWM4y7FfpiAN3KQ") // the "uploads" playlistID for the content creator we're working with
            return [maxResultsItem, partItem, apiKeyItem, playlistIDItem]
        case .twitter:
            let screenNameItem = URLQueryItem(name: "screen_name", value: "WhiteHouse")
            let maxResultsItem = URLQueryItem(name: "count", value: "5")
            let partItem = URLQueryItem(name: "tweet_mode", value: "extended")
            // include_rts && exclude_replies = (Bool, Bool)
            return [maxResultsItem, partItem, screenNameItem]
        case .facebook:
            return []
        case .instagram:
            return []
        }
    }
    
    var requestHeaderFields: [String: String] {
        switch self {
        case .youtube:
            return [:]
        case .twitter:
            let accessToken = "Bearer " + plistValue(for: "TwitterAccessToken")
            return ["Authorization": accessToken]
        case .facebook:
            return [:]
        case .instagram:
            return [:]
        }
    }
    
    fileprivate func plistValue(for key: String) -> String {
        guard let filepath = Bundle.main.path(forResource: "Authorizations", ofType: "plist") else { return "error" }
        let propertyList = NSDictionary.init(contentsOfFile: filepath)
        guard let value = propertyList?.value(forKey: key) as? String else { return "ERROR" }
        return value
    }
}
