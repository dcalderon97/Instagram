//
//  PostCell.swift
//  instagram
//
//  Created by Daniel Calderon on 2/24/18.
//  Copyright © 2018 Daniel Calderon. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostCell: UITableViewCell {
    
    @IBOutlet weak var captionLabel: UILabel!
    
    @IBOutlet weak var postImageView: PFImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
