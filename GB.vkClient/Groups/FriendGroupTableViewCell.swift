//
//  FriendGroupTableViewCell.swift
//  GB.vkClient
//
//  Created by Николай Коробейников on 29.04.2021.
//

import UIKit

class FriendGroupTableViewCell: UITableViewCell {

    @IBOutlet var titleGroupCellName: UILabel!
    @IBOutlet var imgGroupCell: UIImageView!
    
    static let reuseIdentifier = "FriendGroupTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(GroupName: String?, image: UIImage?) {
        titleGroupCellName.text = GroupName
        imgGroupCell.image = image
    }
}
