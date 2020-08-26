//
//  PostDetailVC.swift
//  App with alamofire
//
//  Created by Kairzhan Kural on 8/26/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class PostDetailVC: UIViewController {
    
    var post: Post!
    @IBOutlet var postTitle: UILabel!
    @IBOutlet var postBody: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postTitle.text = post.title
        postBody.text = post.body

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
