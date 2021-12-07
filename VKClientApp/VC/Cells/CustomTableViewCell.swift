//
//  CustomTableViewCell.swift
//  VKClientApp
//
//  Created by Sergey Simashov on 06.12.2021.


import UIKit

class CustomTableViewCell: UITableViewCell {


    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = nil
        nameLabel.text = nil
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(image: UIImage?, text: String?) {
        avatarImageView.image = image
        nameLabel.text = text
    }

    func configure(friend: Friend) {
        if let imageName = friend.avatar {
            avatarImageView.image = UIImage(named: imageName)
        }
        nameLabel.text = friend.name
    }

    func configure(group: Group) {
        if let imageName = group.avatar {
            avatarImageView.image = UIImage(named: imageName)
        }
        nameLabel.text = group.name
    }

}
