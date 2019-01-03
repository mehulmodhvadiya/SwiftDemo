//
//  DynamicVC.swift
//  AlamafireDemo
//
//  Created by Verve Mac on 25/12/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import UIKit

struct GenericDictionary<Key: Hashable, Value> {
    private var data: [Key: Value]
    
    init(data: [Key: Value]) {
        self.data = data
    }
    
    subscript<T>(key: Key) -> T? {
        return data[key] as? T
    }
}

class DynamicVC: UIViewController {

    let arrStatic = [1,2,3,4,5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var earthData = GenericDictionary(data: ["name": "Earth", "population": 7500000000, "moons": 1])
        
        // Automatically infers return type without "as? String"
        let name: String? = earthData["name"]
        
        
        print(bubbleSort([18, 13, 15, 20, 10])) // [0, 1, 2, 3, 4]
        print(arrStatic.enumerated())
        
        
        
        let view = UIView.init(frame: CGRect(x: 10, y: 75, width: self.view.frame.size.width-20, height: 160))
        view.backgroundColor = UIColor.lightGray
        view.alpha = 0.7
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = true
         self.view.addSubview(view)
        
        let lblname = UILabel.init(frame: CGRect(x: self.view.frame.origin.x+10, y: self.view.frame.origin.x+10, width: view.frame.size.width-20, height: 40))
        lblname.backgroundColor = UIColor.white
        lblname.numberOfLines=1
        lblname.backgroundColor = UIColor.white
        lblname.textColor = UIColor.black

        lblname.layer.cornerRadius = 6
        lblname.layer.masksToBounds = true


        lblname.text="Mehul"
        view.addSubview(lblname)

        let lblLastname = UILabel.init(frame: CGRect(x: self.view.frame.origin.x+10, y: lblname.frame.size.height+20, width: view.frame.size.width-20, height: 40))
        lblLastname.backgroundColor = UIColor.white
        lblLastname.numberOfLines=1
        lblLastname.backgroundColor = UIColor.white
        lblLastname.textColor = UIColor.black

        lblLastname.layer.cornerRadius = 6
        lblLastname.layer.masksToBounds = true

        lblLastname.text="Modhvadiya"
        view.addSubview(lblLastname)

        let lblEmail = UILabel.init(frame: CGRect(x: self.view.frame.origin.x+10, y: lblLastname.frame.size.height+70, width: view.frame.size.width-20, height: 40))
        lblEmail.backgroundColor = UIColor.white
        lblEmail.numberOfLines=1
        lblEmail.backgroundColor = UIColor.white
        lblEmail.textColor = UIColor.black

        lblEmail.layer.cornerRadius = 6
        lblEmail.layer.masksToBounds = true

        lblEmail.text="Modhvadiya.mehul@gmail.com"
        view.addSubview(lblEmail)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func bubbleSort<T: Comparable>(_ array: [T]) -> [T] {
        var sortedArray = array
        for i in 0..<sortedArray.count - 1 {
            print(i)
            print(sortedArray.count - 1)
            for j in 1..<sortedArray.count {
                print(j)
                print(sortedArray.count)
                print(sortedArray[j-1])
                print(sortedArray[j])
                if sortedArray[j-1] > sortedArray[j] {
                    sortedArray.swapAt(j-1, j) // New MutableCollection method
                }
            }
        }
        return sortedArray
    }
    


}
