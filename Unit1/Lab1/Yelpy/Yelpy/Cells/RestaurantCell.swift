//
//  RestaurantCell.swift
//  Yelpy
//
//  Created by Sean Stevens on 2/20/22.
//  Copyright © 2022 memo. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {

    @IBOutlet weak var restaurantLabel: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
