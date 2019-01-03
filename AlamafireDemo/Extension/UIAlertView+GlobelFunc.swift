//
//  UIAlertView+GlobelFunc.swift
//  AlamafireDemo
//
//  Created by Verve Mac on 05/12/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import UIKit

extension UIAlertController
{
    static func showAlertMessage(vc: UIViewController, titleStr:String, messageStr:String) -> Void
    {
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "ok", style: .default) { (alert) in
            vc.dismiss(animated: true, completion: nil)
        }
        alert.addAction(alertAction)
        let alertAction1 = UIAlertAction(title: "Cancel", style: .default) { (alert) in
            vc.dismiss(animated: true, completion: nil)
        }
        alert.addAction(alertAction1)
        vc.present(alert, animated: true, completion: nil)
    }
    static func showAlertWithTextField(vc: UIViewController, titleStr:String, messageStr:String,ReasenForClose:String) -> Void
    {
        if "Close" == ReasenForClose {
            let alert = UIAlertController(title: titleStr,message: messageStr, preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "OK", style: .default) { (alert) in
                vc.dismiss(animated: true, completion: nil)

            }
            alert.addAction(alertAction)
            
            //        let nextAction: UIAlertAction = UIAlertAction(title: "Search", style: .default) { action -> Void in
            //            let text = (alert.textFields?.first as! UITextField).text
            //            print("You entered \(text)")
            //        }
            //        alert.addAction(nextAction)
            
            //Add text field
            alert.addTextField { (textField) -> Void in
                let heightConstraint = NSLayoutConstraint(item: textField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 32)
                textField.tintColor = UIColor.black
                textField.layer.cornerRadius = 6
                textField.layer.masksToBounds = true
                textField.layer.borderWidth = 1
                textField.layer.borderColor = UIColor.lightGray.cgColor
                textField.addConstraint(heightConstraint)
            }
            alert.view.tintColor = UIColor.green
            alert.view.backgroundColor = UIColor.white
            vc.present(alert, animated: true, completion: nil)
            
            // change the background color
            let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
            subview.layer.cornerRadius = 1
            subview.backgroundColor = UIColor.white
            }
        }
}
