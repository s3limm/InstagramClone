//
//  TableViewCell.swift
//  InstagramClone
//
//  Created by Selim on 30.07.2024.
//

import UIKit
import Firebase


class TableViewCell: UITableViewCell{
    

    @IBOutlet weak var likeLabel: UILabel!

    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var imageSelector: UIImageView!
    
    @IBOutlet weak var userLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func likesButtonClicked(_ sender: Any) {
        
        
        let fireStoreData = Firestore.firestore()
        
        if let likeCount = Int(likeLabel.text!) {
            
            let likeStore = ["likes": likeCount + 1] as [String : Any]
            
            fireStoreData.collection("Posts").document().setData(likeStore, merge: true)
            
        }
        
        
        
    }

  
    

}
