//
//  AwayEventTableViewCell.swift
//  FinalProject2018
//
//  Created by PeterChen on 2018/7/5.
//  Copyright © 2018年 User02. All rights reserved.
//

import UIKit

class AwayEventTableViewCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
