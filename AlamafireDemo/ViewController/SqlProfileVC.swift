//
//  SqlProfileVC.swift
//  AlamafireDemo
//
//  Created by Verve Mac on 05/12/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import UIKit
import SDWebImage
import SQLite3

class SqlProfileVC: UIViewController
{

    @IBOutlet weak var sqlTablview:UITableView!
    
    let cellReuseIdentifier = "cell"
    var db: OpaquePointer?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
         self.title="Profile"        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveProfileUserData()
    {
        
    }
    
}
extension SqlProfileVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 306.0
    }
}
extension SqlProfileVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row == 0 {
            var cell: SqlProfileCell! = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? SqlProfileCell
            if cell == nil {
                tableView.register(UINib(nibName: "SqlProfileCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
                cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? SqlProfileCell
            }
            
            cell.vwCorner?.layer.cornerRadius = 6
            cell.vwCorner?.layer.masksToBounds=true
            
            let kUserDefault = UserDefaults.standard
            if let dict = kUserDefault.dictionary(forKey: "UserObj") as NSDictionary?{
                kUserDefault.synchronize()
                
                cell.txtName.text = dict["Name"]as? String ?? ""
                cell.txtLastName.text = dict["LastName"]as? String ?? ""
                cell.txtGender.text = dict["Gender"]as? String ?? ""
                cell.txtEmail.text = dict["Email"]as? String ?? ""
                cell.txtDob.text = dict["Dob"]as? String ?? ""
                
                cell.imgProfile.layer.cornerRadius = 50
                cell.imgProfile.layer.masksToBounds =  true
                
                let fileUrl = NSURL(string: (dict["Profile"] as? String)!)
                
                cell.imgProfile.sd_setImage(with: fileUrl! as URL, placeholderImage: UIImage(named: "placeholder.png"))
            }
            return cell
        }else{
            var cell: SqlProfileCell! = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? SqlProfileCell
            if cell == nil {
                tableView.register(UINib(nibName: "SqlProfileCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
                cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? SqlProfileCell
            }
            
            cell.vwCorner?.layer.cornerRadius = 6
            cell.vwCorner?.layer.masksToBounds=true
            
            let kUserDefault = UserDefaults.standard
            if let dict = kUserDefault.dictionary(forKey: "UserObj") as NSDictionary?{
                kUserDefault.synchronize()
                
                cell.txtName.text = dict["Name"]as? String ?? ""
                cell.txtLastName.text = dict["LastName"]as? String ?? ""
                cell.txtGender.text = dict["Gender"]as? String ?? ""
                cell.txtEmail.text = dict["Email"]as? String ?? ""
                cell.txtDob.text = dict["Dob"]as? String ?? ""
                
                cell.imgProfile.layer.cornerRadius = 50
                cell.imgProfile.layer.masksToBounds =  true
                
                let fileUrl = NSURL(string: (dict["Profile"] as? String)!)
                
                cell.imgProfile.sd_setImage(with: fileUrl! as URL, placeholderImage: UIImage(named: "placeholder.png"))
            }
            return cell
        }
    }
}
