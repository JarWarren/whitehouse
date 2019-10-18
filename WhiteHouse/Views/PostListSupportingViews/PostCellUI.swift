//
//  PostCell.swift
//  Herillyn
//
//  Created by Jared Warren on 10/14/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import SwiftUI
import class UIKit.UIImage

struct PostCellUI: View {
    
    // MARK: - Dependencies
    
    var post: Post
    @State var thumbnail = Image("launch")
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            ZStack {
                
                RadialGradient(gradient: Gradient(colors: [.white, .black]), center: .center, startRadius: 8, endRadius: 80)
                
                self.thumbnail
                }.frame(width: 120, height: 90, alignment: .center)
            VStack(alignment: .leading) {
                Text(post.title).bold()
                Text(post.subtitle).font(.caption).lineLimit(2)
            }
            
            Spacer()
        }.onAppear {
            PostController.getThumbnail(for: self.post) { (result) in
                switch result {
                case .success(let thumbnail):
                    self.thumbnail = thumbnail
                case .failure(let error):
                    print(error, error.localizedDescription)
                }
            }
        }
    }
}

struct PostCellUI_Previews: PreviewProvider {
    static var previews: some View {
        PostCellUI(post: Post(title: "Test", subtitle: "Test subtitle.", date: Date(), thumbnailURL: URL(string: "google.com")!, fromSocialMedia: .youtube, id: ""))
    }
}
