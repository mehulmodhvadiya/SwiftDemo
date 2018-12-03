//
//  ViewController.swift
//  AlamafireDemo
//
//  Created by Verve Mac on 22/06/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import Firebase

class ViewController: UIViewController
{
    @IBOutlet weak var labelStatick:UILabel?
    
    var ref:DatabaseReference?
    
    let CellReuseable = "cell"
    
    var someArray = ["1","2","3","4"]
    
    @IBOutlet var tblJSON : UITableView!
    
    var arrRes = [Contacts]()
    var arrRes2 = [MainModelData]()
    var arrRes1 = [Phone]()
    // create a set

    var mySet: Set = ["one", "two", "three", "four"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callWebSErvice1()
        
        
        self.title="Screen 1"
        let login = aGetSetClass(newBool: true)
        
        if login.upperString == true
        {
            print("gettter and setter working proper")
        }
        
//        let login1 = aGetSetClass123(label:"MehulM")
        let login2:String = "MehulM"
        
        if aGetSetClass123(label:"MehulM").name == login2 {
            print("hi")
        }
//        self.view.backgroundColor = UIColor.customGreen
        
//        print(someArray[3])
//        for items in someArray {
//            print(items)
//        }
//
//
//        // iterate over all items in the set
//        for item in mySet {
//            print(item)
//        }
//
//        // create a dictionary
//        var myDictionary = [
//            "First": 1,
//            "Second": 2,
//            "Third": 3]
//
//        // access a single item
//        print(myDictionary["First"])
//
//        // iterate over all keys
//        for (key, value) in myDictionary {
//            print("Key: \(key) - Value: \(value)")
//        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func callWebSErvice(){
        
        Alamofire.request("https://api.androidhive.info/contacts/").responseObject { (response: DataResponse<ContactMainModel>) in
            
            let contactmainmodel = response.result.value
            print(contactmainmodel?.contacts)
            if((contactmainmodel?.contacts?.count)! > 0)
               {
                self.arrRes = (contactmainmodel?.contacts)!
                }
            self.tblJSON.reloadData()
        }
        }
    
    func callWebSErvice1(){
        
//        Alamofire.request("https://jsonplaceholder.typicode.com/users").responseObject { (response: DataResponse<MainModelData>) in
        
            Alamofire.request("").responseArray { (response: DataResponse<[MainModelData]>) in
            
                let forecastArray = response.result.value
                
                if let forecastArray = forecastArray {
                    for forecast in forecastArray {
                        self.arrRes2.append(forecast)
                    }
                                    self.tblJSON.reloadData()
                }
                self.tblJSON.isHidden=true
                self.labelStatick?.text="There are no data found in list."
                
        }
    }
    func setNoDataListFound()
    {
            var title = UILabel()
            let rect = CGRect(origin: CGPoint(x:self.view.frame.size.width/2, y:50), size: CGSize(width:self.view.frame.size.width, height:self.view.frame.size.height))
            title = UILabel(frame: rect)
            title.text = "There are no data found in list."
            title.lineBreakMode = .byWordWrapping
            title.numberOfLines = 0
            title.center = self.view.center
//            title.sizeToFit()
            title.backgroundColor = UIColor.red
            self.view.addSubview(title)
       }
    }



extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       return self.arrRes2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblJSON.dequeueReusableCell(withIdentifier: CellReuseable, for: indexPath) as! TableViewCell
        
//        let phone = arrRes[indexPath.row].phone
//
//        cell.label1?.text = phone?.home ?? ""
//        cell.label2?.text = phone?.mobile ?? ""
        
        
        let company = arrRes2[indexPath.row].company
        
        cell.label1?.text = company?.bs
        cell.label2?.text = company?.name


        return cell
    }
}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
