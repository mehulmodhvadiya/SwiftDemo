//
//  Constant.swift
//  AlamafireDemo
//
//  Created by Verve Mac on 05/12/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import UIKit

struct GlobelConstant {
    
     //  COLOR CONSTANT
    
    static let kColor_Seperator: UIColor = UIColor(red: 53.0/255.0, green: 126.0/255.0, blue: 167.0/255.0, alpha: 1.0)
    static let kColor_orange: UIColor = UIColor(red: 255.0/255.0, green: 147.0/255.0, blue: 38.0/255.0, alpha: 1.0)
    static let kColor_NonCompliant: UIColor = UIColor(red: 190.0/255.0, green: 15.0/255.0, blue: 52.0/255.0, alpha: 1.0)
    
    //  Device IPHONE
    static let kIphone_4s : Bool =  (UIScreen.main.bounds.size.height == 480)
    static let kIphone_5 : Bool =  (UIScreen.main.bounds.size.height == 568)
    static let kIphone_6 : Bool =  (UIScreen.main.bounds.size.height == 667)
    static let kIphone_6_Plus : Bool =  (UIScreen.main.bounds.size.height == 736)
    
    //   Constant Variable.
    static let kBirthDate                     =    "DateOfBirth"
    static let kFirstName                     =    "FirstName"
    static let kLastName                      =    "LastName"
}



