//
//  String+Shortcuts.swift
//  AlamafireDemo
//
//  Created by Verve Mac on 27/06/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import Foundation

extension String {
    
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString)
    }
}
