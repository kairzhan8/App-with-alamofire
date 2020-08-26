//
//  AddPostViewController.swift
//  App with alamofire
//
//  Created by Kairzhan Kural on 8/26/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit
import Alamofire

class AddPostViewController: UIViewController {
    
    var posts: [Post]!
    
    var parameters: [String : Any] = [:]
    let url = "https://jsonplaceholder.typicode.com/posts"

    @IBOutlet var postUserId: UITextField!
    @IBOutlet var postTitle: UITextField!
    @IBOutlet var postBody: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addPost() {
            parameters["userId"] = postUserId.text
            parameters["title"] = postTitle.text
            parameters["body"] = postBody.text
            print(parameters)
            postWithAlamofire()
    }
    
    
    func postWithAlamofire() {
        guard let url = URL(string: url) else { return }
        AF.request(url, method: .post, parameters: parameters).validate().responseJSON { responseData in
            guard let statusCode = responseData.response?.statusCode else { return }
            print(statusCode)
            switch responseData.result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    

}
