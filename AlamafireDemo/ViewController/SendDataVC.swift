//
//  SendDataVC.swift
//  AlamafireDemo
//
//  Created by Verve Mac on 24/12/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import UIKit

class SendDataVC: UIViewController {

    var arrCountry = [CountryData1]()
    
    let cellReuseable = "cell"
    
    @IBOutlet weak var tableList:UITableView!
    override func viewDidLoad() {

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
extension SendDataVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 61.0
    }
}
extension SendDataVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrCountry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell: ListCell! = tableView.dequeueReusableCell(withIdentifier: cellReuseable) as? ListCell
        if cell == nil {
            tableView.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: cellReuseable)
            cell = tableView.dequeueReusableCell(withIdentifier: cellReuseable) as? ListCell
        }
        
        
        
        cell.vwCorner?.layer.cornerRadius = 6
        cell.vwCorner?.layer.masksToBounds=true
        
        cell.lblUsername?.text = self.arrCountry[indexPath.row].country_name
        cell.lblEmail?.text = self.arrCountry[indexPath.row].code
        
        return cell
    }
    
    
}
