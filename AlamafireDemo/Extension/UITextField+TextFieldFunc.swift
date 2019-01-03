//
//  UITextField+TextFieldFunc.swift
//  AlamafireDemo
//
//  Created by Verve Mac on 05/12/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import UIKit

extension UITextField{
    
    //set cornerRadius
    func cornerRadius(){
        self.layoutIfNeeded()
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
    
    //set bordercolor
    func borderColor(){
        self.layer.borderColor = GlobelConstant.kColor_orange.cgColor
        self.layer.borderWidth = 1.0
    }
    
    //set borderWidth
    func borderWidth(size:CGFloat){
        self.layer.borderWidth = size
    }
    
    //check textfield is blank
//    func blank() -> Bool{
//        let strTrimmed = self.text!.trim()//get trimmed string
//        if(strTrimmed.characters.count == 0)//check textfield is nil or not ,if nil then return false
//        {
//            return true
//        }
//        return false
//    }
    
    //set begginning space - left space
    func setLeftPadding(paddingValue:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: paddingValue, height: self.frame.size.height))
        self.leftViewMode = .always
        self.leftView = paddingView
    }
    
    //set end of space
    func setRightPadding(paddingValue:CGFloat){
        let paddingView = UIView(frame: CGRect(x: (self.frame.size.width - paddingValue), y: 0, width: paddingValue, height: self.frame.size.height))
        self.rightViewMode = .always
        self.rightView = paddingView
    }
}
