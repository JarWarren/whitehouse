//
//  MainTabUI.swift
//  WhiteHouse
//
//  Created by Jared Warren on 10/17/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import SwiftUI

struct MainTabUI: View {
    var body: some View {
        TabView {
            PostListUI(socialMedia: .youtube).tabItem {
                    Image("youtubeLogoIcon")
                    Text("YouTube")
            }.tag(0)
            PostListUI(socialMedia: .twitter)
                .tabItem {
                    Image("twitterLogoIcon")
                    Text("Twitter")
            }.tag(1)
            PostListUI(socialMedia: .facebook)
                .tabItem {
                    Image("facebookLogoIcon")
                    Text("Facebook")
            }.tag(2)
            PostListUI(socialMedia: .instagram)
                .tabItem {
                    Image("instagramLogoIcon")
                    Text("Instagram")
            }.tag(3)
        }
    }
}

struct MainTabUI_Previews: PreviewProvider {
    static var previews: some View {
        MainTabUI()
    }
}
