//
//  UIView+Method.swift
//  AlamafireDemo
//
//  Created by Verve Mac on 25/12/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import Foundation
import UIKit

class customView{
    
    func viewInit(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat) -> UIView
    {
        let view = UIView.init(frame: CGRect(x: x, y: y, width: width, height: height))
        view.backgroundColor = UIColor.lightGray
        view.alpha = 0.7
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = true
        
        return view
    }

    
}
