//
//  CodableleList.swift
//  AlamafireDemo
//
//  Created by Verve Mac on 04/12/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import UIKit

class CodableleList: UITableViewCell {

    @IBOutlet weak var lblUsername:UILabel?
    @IBOutlet weak var lblEmail:UILabel?
    @IBOutlet weak var vwCorner:UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
