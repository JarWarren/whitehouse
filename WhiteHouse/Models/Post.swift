//
//  Post.swift
//  WhiteHouse
//
//  Created by Jared Warren on 10/15/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import Foundation

// MARK: - Post Class

struct Post: Hashable {
    
    let title: String
    let subtitle: String
    let date: Date
    let thumbnailURL: URL
    let fromSocialMedia: SocialMedia
    let id: String
}

// MARK: - from YouTube

extension Post {
    init(_ youtubeObject: YouTubeTopObject.YTVideoObject.YTVideoObjectSnippet) {
        self.title = youtubeObject.title
        self.subtitle = youtubeObject.description ?? ""
        self.thumbnailURL = youtubeObject.thumbnails.defaultres.url
        self.fromSocialMedia = .youtube
        self.id = youtubeObject.resourceId.videoId
        
        let formatter = DateFormatter()
        self.date = formatter.date(from: youtubeObject.publishedAt) ?? Date()
    }
}

// MARK: - from Twitter

extension Post {
    init(_ twitterObject: TwitterObject) {
        self.title = twitterObject.user.name
        self.subtitle = twitterObject.fullText
        self.thumbnailURL = twitterObject.user.profileImageUrlHttps
        self.fromSocialMedia = .twitter
        self.id = String(twitterObject.id)
        
        let formatter = DateFormatter()
        self.date = formatter.date(from: twitterObject.createdAt) ?? Date()
    }
}

// MARK: - from Facebook



// MARK: - from Instagram
