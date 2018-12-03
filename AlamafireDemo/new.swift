//
//  new.swift
//  AlamafireDemo
//
//  Created by Verve Mac on 23/11/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import Foundation

class aGetSetClass{
    
    var uppercaseString : Bool
    
    var upperString : Bool {
        get {
            return uppercaseString
        }
        set (value) {
            self.uppercaseString = value
        }
    }
    
    init(newBool:Bool){
        uppercaseString = newBool
    }
    
}
class aGetSetClass123{
    
    var nameString : String
    
    var name : String {
        get {
            return nameString
        }
        set (value) {
            self.nameString = value
        }
    }
    
    init(label:String){
        nameString = label
    }
    
}
enum UserDefaultsKeys : String {
    case isLoggedIn
    case userID
}
extension UserDefaults
{
    //MARK: Check Login
    func setLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        //synchronize()
    }
    
    func isLoggedIn()-> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    //MARK: Save User Data
    func setUserID(value: Int){
        set(value, forKey: UserDefaultsKeys.userID.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve User Data
    func getUserID() -> Int{
        return integer(forKey: UserDefaultsKeys.userID.rawValue)
    }
}

extension String {
    func isEqualToString(find: String) -> Bool {
        return String(format: self) == find
    }
}
