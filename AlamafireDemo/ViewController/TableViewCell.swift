//
//  TableViewCell.swift
//  AlamafireDemo
//
//  Created by Verve Mac on 25/06/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var label1 : UILabel!
    
    @IBOutlet var label2 : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
