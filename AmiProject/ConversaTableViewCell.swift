//
//  ConversaTableViewCell.swift
//  AmiProject
//
//  Created by student on 27/04/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class ConversaTableViewCell: UITableViewCell {

   
    
    @IBOutlet weak var tagPrincipalLabel: UILabel!
    @IBOutlet weak var perigoLabel: UILabel!
    @IBOutlet weak var brinquedoLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
