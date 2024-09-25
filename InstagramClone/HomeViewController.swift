//
//  HomeViewController.swift
//  InstagramClone
//
//  Created by Selim on 26.07.2024.
//

import UIKit
import Firebase
import SDWebImage

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
 
    var errorMW = ErrorMiddleware()
    var userArray = [String]()
    var commentArray = [String]()
    var likesArray = [Int]()
    var imageArray = [String]()
    var idArray = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        getDatas()
       
    }
    
    func getDatas() {
        
        let fireDatabase = Firestore.firestore()
        fireDatabase.collection("Posts").order(by: "date", descending: true)
            .addSnapshotListener { snapshot, error in
            
            if error != nil {
                let alert = self.errorMW.errorFunc(_title: "Error!", _message: error!.localizedDescription)
                self.present(alert, animated: true)
            }
            
            else{
                
                if snapshot?.isEmpty != true {
                    
                    for document in snapshot!.documents {
                        
                        let documentID = document.documentID
                        self.idArray.append(documentID)
                        
                        
                        if let user = document.get("postedBy") as? String
                        {
                            self.userArray.append(user)
                        }
                        
                        if let postComment = document.get("postComment") as? String {
                            self.commentArray.append(postComment)
                        }
                        
                        if let imageUrl = document.get("imageUrl") as? String {
                            self.imageArray.append(imageUrl)
                        }
                        
                        if let likes = document.get("likes") as? Int{
                            self.likesArray.append(likes)
                        }
                        
                        self.tableView.reloadData()
                        
                    }
                    
                }
                
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.userLabel.text = userArray[indexPath.row]
        cell.commentLabel.text = commentArray[indexPath.row]
        cell.imageSelector.sd_setImage(with: URL(string: self.imageArray[indexPath.row]))
        cell.likeLabel.text = String(likesArray[indexPath.row])
        return cell
    }

}
