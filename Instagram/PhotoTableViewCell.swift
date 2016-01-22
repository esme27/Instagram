//
//  PhotoTableViewCell.swift
//  Instagram
//
//  Created by Esme Romero on 1/21/16.
//  Copyright © 2016 Esme Romero. All rights reserved.
//

import UIKit


class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var photoViewLabel: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
