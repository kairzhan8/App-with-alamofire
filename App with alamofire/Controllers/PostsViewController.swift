//
//  PostsViewController.swift
//  App with alamofire
//
//  Created by Kairzhan Kural on 8/26/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit
import Alamofire

class PostsViewController: UICollectionViewController {
    
    var posts: [Post] = []
    let url = "https://jsonplaceholder.typicode.com/posts"

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return posts.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "posts", for: indexPath) as! PostCell
    
        let post = posts[indexPath.item]
        cell.configure(with: post)
    
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailPost" {
            let postDetailVC = segue.destination as! PostDetailVC
            let cell = sender as! UICollectionViewCell
            let indexPath = collectionView.indexPath(for: cell)
            postDetailVC.post = posts[indexPath!.row]
        }
        
    }
    func fetchData() {
        guard let url = URL(string: url) else { return }
        AF.request(url).validate().responseJSON { responseData in
            switch responseData.result {
            case .success(let value):
                self.posts = Post.getPosts(from: value)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
            
        }
        
        

}
}
