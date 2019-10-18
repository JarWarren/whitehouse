//
//  PostDetailUI.swift
//  WhiteHouse
//
//  Created by Jared Warren on 10/17/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import SwiftUI

struct PostDetailUI: View {
    
    var post: Post
    
    var body: some View {
        VStack {
            Text(post.title).font(.title)
            Text(post.date.asString).font(.caption).foregroundColor(Color.purple)
            Text(post.subtitle).font(.subheadline)
        }
    }
}

struct PostDetailUI_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailUI(post: Post(title: "Test", subtitle: "Test subtitle.", date: Date(), thumbnailURL: URL(string: "google.com")!, fromSocialMedia: .youtube, id: ""))
    }
}
