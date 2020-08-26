//
//  PostCell.swift
//  App with alamofire
//
//  Created by Kairzhan Kural on 8/26/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class PostCell: UICollectionViewCell {
    
    @IBOutlet var postId: UILabel!
    @IBOutlet var postTitle: UILabel!
    @IBOutlet var postBody: UILabel!
    
    func configure(with post: Post) {
        postId.text = String(post.id)
        postTitle.text = post.title
    }
}
