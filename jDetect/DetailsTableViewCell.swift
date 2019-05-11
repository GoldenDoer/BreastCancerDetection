//
//  DetailsTableViewCell.swift
//  jDetect
//
//  Created by frestie ngongo on 4/16/19.
//  Copyright © 2019 frestie ngongo. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var lblcancer: UILabel!
    
    @IBOutlet weak var lbltime: UILabel!
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var lblcancerhistries: UILabel!
    @IBOutlet weak var imgcancer: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
