//
//  Posts.swift
//  App with alamofire
//
//  Created by Kairzhan Kural on 8/26/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//
import UIKit

struct Post {
    let id: Int
    let title: String
    let body: String
    let userId: Int
    
    init(dictPost: [String:Any]) {
        id =  dictPost["id"] as! Int
        title = dictPost["title"] as! String
        body = dictPost["body"] as! String
        userId = dictPost["userId"] as! Int
    }
    
    static func getPosts(from jsonData: Any) -> [Post] {
        guard let jsonData = jsonData as? Array<[String:Any]> else { return [] }
        return jsonData.compactMap { Post.init(dictPost: $0) }
    }
}
