//
//  ListViewCell.swift
//  FinalProject2018
//
//  Created by User02 on 2018/6/30.
//  Copyright © 2018年 User02. All rights reserved.
//


import UIKit

class CollectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var review: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
