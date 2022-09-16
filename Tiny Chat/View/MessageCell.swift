//
//  MessageCell.swift
//  Tiny Chat
//
//  Created by Wonil Lee on 2022/09/15.
//

import UIKit

class MessageCell: UITableViewCell {

	@IBOutlet weak var messageBubble: UIView!
	@IBOutlet weak var label: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib() 
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
