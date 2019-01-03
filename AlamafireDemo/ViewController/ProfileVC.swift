//
//  ProfileVC.swift
//  AlamafireDemo
//
//  Created by Verve Mac on 30/11/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import SDWebImage
import SQLite3

class ProfileVC: UIViewController {

    @IBOutlet weak var imgProfile:UIImageView!
    
    @IBOutlet weak var txtName:UITextField!
    @IBOutlet weak var txLasttName:UITextField!
    @IBOutlet weak var txtGender:UITextField!
    @IBOutlet weak var txtEmail:UITextField!
    @IBOutlet weak var txtDob:UITextField!
    @IBOutlet weak var txtPassword:UITextField!

    var ref:DatabaseReference!
    var db: OpaquePointer?
    var statement: OpaquePointer?
    override func viewDidLoad() {
        super.viewDidLoad()
       
        imgProfile.layer.cornerRadius = 50
        imgProfile.layer.masksToBounds = true
        
        let kUserDefault = UserDefaults.standard
        if let dict = kUserDefault.dictionary(forKey: "UserObj") as NSDictionary?{
            kUserDefault.synchronize()
            
            self.txtName.text = dict["Name"]as? String ?? ""
            self.txLasttName.text = dict["LastName"]as? String ?? ""
            self.txtGender.text = dict["Gender"]as? String ?? ""
            self.txtEmail.text = dict["Email"]as? String ?? ""
            self.txtDob.text = dict["Dob"]as? String ?? ""
            self.txtPassword.text = dict["Password"]as? String ?? ""
            
            let fileUrl = NSURL(string: (dict["Profile"] as? String)!)
            
            self.imgProfile.sd_setImage(with: fileUrl! as URL, placeholderImage: UIImage(named: "placeholder.png"))

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
