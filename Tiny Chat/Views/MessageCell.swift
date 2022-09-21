//
//  MessageCell.swift
//  Tiny Chat
//
//  Created by Wonil Lee on 2022/09/15.
// aaa

import UIKit

class MessageCell: UITableViewCell {

	@IBOutlet weak var messageBubble: UIView!
	@IBOutlet weak var label: UILabel!
	@IBOutlet weak var rightImageView: UIImageView!
	@IBOutlet weak var leftImageView: UIImageView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
			// Initialization code
		messageBubble.layer.cornerRadius = messageBubble.frame.size.width / 30
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
			super.setSelected(selected, animated: animated)

			// Configure the view for the selected state
	}
    
}
