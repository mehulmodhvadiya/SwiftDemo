//
//  SqlProfileCell.swift
//  AlamafireDemo
//
//  Created by Verve Mac on 05/12/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import UIKit

class SqlProfileCell: UITableViewCell {

    @IBOutlet weak var txtName:UITextField!
    @IBOutlet weak var txtLastName:UITextField!
    @IBOutlet weak var txtEmail:UITextField!
    @IBOutlet weak var txtGender:UITextField!
    @IBOutlet weak var txtDob:UITextField!
    @IBOutlet weak var vwCorner:UIView?
    @IBOutlet weak var imgProfile:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
