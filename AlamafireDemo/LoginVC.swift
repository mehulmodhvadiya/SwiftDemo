//
//  LoginVC.swift
//  AlamafireDemo
//
//  Created by Verve Mac on 29/11/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LoginVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtEmail:UITextField!
    @IBOutlet weak var txtPassword:UITextField!
    
    var refDatabase: DatabaseReference!
    var alert: UIAlertController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        refDatabase = Database.database().reference().child("User").child("-LSTJUuHBuRD2Um9WUl7")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func gotoHomePage()
    {
            SVProgressHUD.show()
            refDatabase.observeSingleEvent(of: .value, with: { (snapshot) in
                SVProgressHUD.dismiss()
                if !snapshot.exists(){
                    return
                }
                //print(snapshot.value)
                
                UserDefaults.standard.setLoggedIn(value: true)
                // user login responce
                let kUserDefault = UserDefaults.standard
                kUserDefault.set(snapshot.value, forKey: "UserObj")
                kUserDefault.synchronize()
                
                let value = snapshot.value as? NSDictionary
                let email = value?["Email"] as? String ?? ""
                let password = value?["Password"] as? String ?? ""
                
                if (email == self.txtEmail.text && password == self.txtPassword.text)
                {
                    if UserDefaults.standard.isLoggedIn()
                    {
                        let uploadObj = self.storyboard?.instantiateViewController(withIdentifier: "UploadImageVC") as? UploadImageVC
                        self.navigationController?.pushViewController(uploadObj!, animated: true)
                    }
                    else{
                        
                    }
                }
                else{
                }
            })
  }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if  self.txtEmail.text == "" && self.txtPassword.text == ""{
            self.txtEmail.layer.borderColor=UIColor.red.cgColor
            self.txtEmail.layer.cornerRadius=6
            self.txtEmail.layer.borderWidth = 1
            self.txtPassword.layer.borderColor=UIColor.red.cgColor
            self.txtPassword.layer.borderWidth = 1
            self.txtPassword.layer.cornerRadius=6
        }
        else if  self.txtEmail.text == ""
        {
            self.txtEmail.layer.borderColor=UIColor.red.cgColor
            self.txtEmail.layer.cornerRadius=6
            self.txtEmail.layer.borderWidth = 1
            
            self.txtPassword.layer.borderColor=UIColor.black.cgColor
            self.txtPassword.layer.borderWidth = 1
            self.txtPassword.layer.cornerRadius=6

            
        }else if self.txtPassword.text == ""
        {
            self.txtPassword.layer.borderColor=UIColor.red.cgColor
            self.txtPassword.layer.borderWidth = 1
            self.txtPassword.layer.cornerRadius=6
            
            self.txtEmail.layer.borderColor=UIColor.black.cgColor
            self.txtEmail.layer.cornerRadius=6
            self.txtEmail.layer.borderWidth = 1

        }else{
            self.txtEmail.layer.borderColor=UIColor.black.cgColor
            self.txtEmail.layer.cornerRadius=6
            self.txtEmail.layer.borderWidth = 1
            self.txtPassword.layer.borderColor=UIColor.black.cgColor
            self.txtPassword.layer.borderWidth = 1
            self.txtPassword.layer.cornerRadius=6
        }
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool
    {
        return true
    }

    @IBAction func gotoRegisterPage()
    {
        let registerObj = storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as? RegisterVC
        self.navigationController?.pushViewController(registerObj!, animated: true)
    }
}
