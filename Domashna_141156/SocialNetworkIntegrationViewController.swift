//
//  SocialNetworkIntegrationViewController.swift
//  Domashna_141156
//
//  Created by Filip Sardzoski on 4/19/17.
//  Copyright © 2017 Filip Sardzoski. All rights reserved.
//

import UIKit
import TwitterKit

class SocialNetworkIntegrationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: Base this Tweet ID on some data from elsewhere in your app
        TWTRAPIClient().loadTweet(withID: "854810592691052544") { (tweet, error) in
        let tweetView = TWTRTweetView(tweet: tweet)
        tweetView.center = CGPoint(x: self.view.center.x, y: self.topLayoutGuide.length + tweetView.frame.size.height / 2);
        self.view.addSubview(tweetView)
        }

        // Do any additional setup after loading the view.
    }
}
