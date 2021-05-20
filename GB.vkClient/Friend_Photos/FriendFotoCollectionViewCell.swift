//
//Users/korobeynikov.n/Desktop/GB/GB.vkClient/GB.vkClient/data//  FriendFotoCollectionViewCell.swift
//  GB.vkClient
//
//  Created by Николай Коробейников on 29.04.2021.
//

import UIKit

class FriendFotoCollectionViewCell: UICollectionViewCell {
    static let reuseID = "FriendFotoCollectionViewCell"
    
    var likeControlTapped: ((Int) -> Void)?
    
    @IBOutlet var titleFriendNameLabel: UILabel!
    @IBOutlet var imgFullFriend: UIImageView!
    @IBOutlet var likeControl: likeControl!
    
    func configure(FriendName: String?, image: UIImage?, likeCount: Int?) {
        titleFriendNameLabel.text = FriendName
        imgFullFriend.image = image
        likeControl.setLike(count: likeCount!)
        likeControl.addTarget(self, action: #selector(likeTapped), for: .valueChanged)
        
    }
    
    @objc func likeTapped() {
        likeControlTapped?(likeControl.likeCount)
    }
    
}


