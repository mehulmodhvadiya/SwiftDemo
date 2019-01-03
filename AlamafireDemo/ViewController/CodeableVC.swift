//
//  CodeableVC.swift
//  AlamafireDemo
//
//  Created by Verve Mac on 04/12/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
import SVProgressHUD

class CodeableVC: UIViewController {

    @IBOutlet weak var tblList:UITableView!
    
    var arrRes3 = [Data]()
    var arrRes4 = [MainCodeAbleJson]()
    let cellReuseable = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "CodAbleVC"
        
        DispatchQueue.main.async {
            self.callwsGetWebService12()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    func callwsGetWebService1()
//    {
//        SVProgressHUD.show()
//        Alamofire.request("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=23.0225,72.5714&radius=500&type=restaurant&key=AIzaSyBav6eNOBLnTmk1Z4C4elSMHe0lL7-Im08", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
//
//            if let httpResponse = response.response {
//                if httpResponse.statusCode == 200 {
//                    if let result = response.result.value as? [String:Any] {
//                        if let customerData = result["results"] as? [[String: Any]]
//                        {
//                            for result in customerData{
//                                do {
//                                    let jsonData = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
////                                    let reqJSONStr = String(data: jsonData, encoding: .utf8)
////                                    let data = reqJSONStr?.data(using: .utf8)
//                                    let jsonDecoder = JSONDecoder()
//
//                                    let aContact = try jsonDecoder.decode([MainCodeAbleJson].self, from: jsonData)
//                                    self.arrRes4.append(aContact)
//                                    self.tblList.reloadData()
//                                    SVProgressHUD.dismiss()
//                                }
//                                catch {
//
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
    
    
    func callwsGetWebService12()
    {
        SVProgressHUD.show()
        Alamofire.request(URL(string: "https://jsonplaceholder.typicode.com/users")!).responseJSON { response in
            let json = response.data
            
            do{
                SVProgressHUD.dismiss()
                //created the json decoder
                let decoder = JSONDecoder()
                
                //using the array to put values
                self.arrRes4 = try decoder.decode([MainCodeAbleJson].self, from: json!)
                self.tblList.reloadData()
                
                //printing all the hero names
//                for hero in self.heroes{
//                    print(hero.name!)
//                }
                
            }catch let err{
                print(err)
            }
        }
        
        
//        SVProgressHUD.show()
//        Alamofire.request("", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
//            print(response.data)
//            let json = response.data
////            if let httpResponse = response.response {
////                if httpResponse.statusCode == 200 {
////                    if let result = response.result.value as? [[String:Any]]
////                    {
//                                do {
//                                    SVProgressHUD.dismiss()
////                                    let jsonData = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
////                                          let reqJSONStr = String(data: json, encoding: .utf8)
////                                          let data = reqJSONStr?.data(using: .utf8)
//                                    let jsonDecoder = JSONDecoder()
//
//                                    let aContact = try jsonDecoder.decode(MainCodeAbleJson.self, from: json!)
//
//                                    self.arrRes4.append(aContact)
//
//                                    self.tblList.reloadData()
//
//                                }
//                                catch {
//
//                                }
////                    }
////                }
////            }
//        }
    }
    
    
}
extension CodeableVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 61.0
    }
}
extension CodeableVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrRes4.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: CodableleList! = tableView.dequeueReusableCell(withIdentifier: cellReuseable) as? CodableleList
        if cell == nil {
            tableView.register(UINib(nibName: "CodableleList", bundle: nil), forCellReuseIdentifier: cellReuseable)
            cell = tableView.dequeueReusableCell(withIdentifier: cellReuseable) as? CodableleList
        }
        
        cell.vwCorner?.layer.cornerRadius = 6
        cell.vwCorner?.layer.masksToBounds=true
        
        cell.lblUsername?.text = arrRes4[indexPath.row].address?.city
        cell.lblEmail?.text = arrRes4[indexPath.row].address?.street
        
        return cell
    }
}
