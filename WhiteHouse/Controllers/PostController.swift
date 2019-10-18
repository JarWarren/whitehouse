//
//  PostController.swift
//  WhiteHouse
//
//  Created by Jared Warren on 10/15/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import Foundation
import struct SwiftUI.Image
import class UIKit.UIImage

class PostController {
    
    // MARK: - GET
    
    static func getPosts(from socialMedia: SocialMedia, completion: @escaping (Result <[Post], PostError>) -> Void) {
        
        guard let baseURL = socialMedia.baseURL else { completion(.failure(.invalidURL(socialMedia))); return }
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        components?.queryItems = socialMedia.queryItems
        
        guard let finalURL = components?.url else { completion(.failure(.invalidURL(socialMedia))); return }
        
        var request = URLRequest(url: finalURL)
        request.allHTTPHeaderFields = socialMedia.requestHeaderFields
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error { completion(.failure(.appleError(error))); return }
            guard let data = data else { completion(.failure(.noData(socialMedia))); return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                switch socialMedia {
                case .youtube:
                    let youtubeTopObject = try decoder.decode(YouTubeTopObject.self, from: data)
                    let youtubeVideoSnippets = youtubeTopObject.items.map { $0.snippet }
                    let posts = youtubeVideoSnippets.map { Post($0) }
                    completion(.success(posts))
                case .twitter:
                    let twitterTopObjects = try decoder.decode([TwitterObject].self, from: data)
                    let posts = twitterTopObjects.map { Post($0) }
                    completion(.success(posts))
                case .facebook:
                    print(data.humanReadable)
                    completion(.success([]))
                case .instagram:
                    print(data.humanReadable)
                    completion(.success([]))
                }
            } catch {
                completion(.failure(.appleError(error)))
            }
        }.resume()
    }
    
    static func getThumbnail(for post: Post, completion: @escaping (Result <Image, PostError>) -> Void) {
        
        URLSession.shared.dataTask(with: post.thumbnailURL) { (data, _, error) in
             if let error = error { completion(.failure(.appleError(error))); return }
            guard let data = data else { completion(.failure(.noData(post.fromSocialMedia))); return }
            guard let uiThumbnail = UIImage(data: data) else { completion(.failure(.unableToDecodeImage)); return }
            let thumbnail = Image(uiImage: uiThumbnail)
            completion(.success(thumbnail))
        }.resume()
    }
}
