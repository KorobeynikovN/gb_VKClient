//
//  FriendsTableViewCell.swift
//  GB.vkClient
//
//  Created by Николай Коробейников on 29.04.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "FriendsTableViewCell"

    @IBOutlet var img: UIImageView!
    @IBOutlet var fioLabel: UILabel!
    @IBOutlet var nameLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(titleName: String?, titleFIO: String?, image: UIImage?) {
        nameLable.text = titleName
        fioLabel.text = titleFIO
        img.image = image
        img.layer.cornerRadius = 10
    }
}
