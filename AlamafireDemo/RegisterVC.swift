//
//  RegisterVC.swift
//  AlamafireDemo
//
//  Created by Verve Mac on 29/11/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import UIKit
import FirebaseDatabase
import SVProgressHUD


class RegisterVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtName:UITextField!
    @IBOutlet weak var txLasttName:UITextField!
    @IBOutlet weak var txtGender:UITextField!
    @IBOutlet weak var txtEmail:UITextField!
    @IBOutlet weak var txtDob:UITextField!
    @IBOutlet weak var txtPassword:UITextField!
    
    var refDatabase: DatabaseReference!
    
    var alert: UIAlertController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Register"
        txtName.delegate=self
        txLasttName.delegate=self
        txtGender.delegate=self
        txtEmail.delegate=self
        txtDob.delegate=self
        txtPassword.delegate=self
        
        refDatabase = Database.database().reference().child("User")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func saveRegisterObj()
    {
        if (txtName.text == "" && txLasttName.text == "" && txtGender.text == "" && txtEmail.text == "" && txtDob.text == "" && txtPassword.text == "")
        {
        }else
        {
            SVProgressHUD.show()
            let key = refDatabase.childByAutoId().key
            
            let UserDataObj = ["id":key,
                                  "Name": txtName.text! as String,
                                  "LastName": txLasttName.text! as String,
                                  "Gender": txtGender.text! as String,
                                  "Email": txtEmail.text! as String,
                                  "Dob": txtDob.text! as String,
                                  "Password": txtPassword.text! as String,
                    ]
            refDatabase.child(key).setValue(UserDataObj)
            SVProgressHUD.dismiss()
            let uploadObj = self.storyboard?.instantiateViewController(withIdentifier: "UploadImageVC") as? UploadImageVC
            self.navigationController?.pushViewController(uploadObj!, animated: true)
        }
    }
    @IBAction func backviewController()
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func userProfileVC()
    {
        
    }
}
