//
//  PostsView.swift
//  WhiteHouse
//
//  Created by Jared Warren on 10/16/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import SwiftUI

struct PostListUI: View {
    
    let socialMedia: SocialMedia
    
    @State var posts = [Post]()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(posts, id: \.self) { post in
                    NavigationLink(destination: PostDetailUI(post: post)) {
                        PostCellUI(post: post)
                    }
                }
            }.onAppear {
                guard self.posts.isEmpty else { return }
                PostController.getPosts(from: self.socialMedia) { (result) in
                    switch result {
                    case .success(let posts):
                        self.posts = posts
                    case .failure(let error):
                        print(error, error.localizedDescription)
                    }
                }
            }.navigationBarTitle(socialMedia.rawValue)
        }
    }
}

struct PostsUI_Previews: PreviewProvider {
    static var previews: some View {
        PostListUI(socialMedia: .youtube)
    }
}
