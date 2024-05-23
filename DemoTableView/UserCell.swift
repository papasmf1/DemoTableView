//
//  UserCell.swift
//  DemoTableView
//
//  Created by user on 5/23/24.
//

import UIKit

class UserCell: UITableViewCell {

    
    @IBOutlet var lastName: UILabel!
    @IBOutlet var firstName: UILabel!
    @IBOutlet var street: UILabel!
    @IBOutlet var mobilePhone: UILabel!
    
    @IBOutlet var thumbnail: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
