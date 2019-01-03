//
//  UIDate+GlobalDateFunc.swift
//  AlamafireDemo
//
//  Created by Verve Mac on 05/12/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import UIKit

let YYYY_MM_DD_HH_MM_SS_zzzz = "yyyy-MM-dd HH:mm:ss +zzzz"
let YYYY_MM_DD_HH_MM_SS = "dd-MM-yyyy HH:mm:ss"
let DD_MM_YYYY = "dd-MM-yyyy"
let MM_DD_YYYY = "MM-dd-yyyy"
let YYYY_DD_MM = "yyyy-dd-MM"
let YYYY_MM_DD_T_HH_MM_SS = "yyyy-MM-dd'T'HH:mm:ss"

extension Date{
    
    //convert string to date
    static func convertStringToDate(strDate:String, dateFormate strFormate:String) -> Date{
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = strFormate
        dateFormate.timeZone = TimeZone.init(abbreviation: "UTC")
        let dateResult:Date = dateFormate.date(from: strDate)!
        
        return dateResult
    }
    
    //Function for old date format to new format from UTC to local
    static func convertDateUTCToLocal(strDate:String, oldFormate strOldFormate:String, newFormate strNewFormate:String) -> String{
        let dateFormatterUTC:DateFormatter = DateFormatter()
        dateFormatterUTC.timeZone = NSTimeZone(abbreviation: "UTC") as TimeZone!//set UTC timeZone
        dateFormatterUTC.dateFormat = strOldFormate //set old Format
        if let oldDate:Date = dateFormatterUTC.date(from: strDate)  as Date?//convert date from input string
        {
            dateFormatterUTC.timeZone = NSTimeZone.local//set localtimeZone
            dateFormatterUTC.dateFormat = strNewFormate //make new dateformatter for output format
            if let strNewDate:String = dateFormatterUTC.string(from: oldDate as Date) as String?//convert dateInUTC into string and set into output
            {
                return strNewDate
            }
            return strDate
        }
        return strDate
    }
    
    //Convert without UTC to local
    static func convertDateToLocal(strDate:String, oldFormate strOldFormate:String, newFormate strNewFormate:String) -> String{
        let dateFormatterUTC:DateFormatter = DateFormatter()
        //set local timeZone
        dateFormatterUTC.dateFormat = strOldFormate //set old Format
        if let oldDate:Date = dateFormatterUTC.date(from: strDate) as Date?//convert date from input string
        {
            dateFormatterUTC.timeZone = NSTimeZone.local
            dateFormatterUTC.dateFormat = strNewFormate //make new dateformatter for output format
            if let strNewDate = dateFormatterUTC.string(from: oldDate as Date) as String?//convert dateInUTC into string and set into output
            {
                return strNewDate
            }
            return strDate
        }
        return strDate
    }
    
    //Convert Date to String
    func convertDateToString(strDateFormate:String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = strDateFormate
        let strDate = dateFormatter.string(from: self)
        //      dateFormatter = nil
        return strDate
    }
    
    
    //Convert local to utc
    static func convertLocalToUTC(strDate:String, oldFormate strOldFormate:String, newFormate strNewFormate:String) -> String{
        let dateFormatterUTC:DateFormatter = DateFormatter()
        dateFormatterUTC.timeZone = NSTimeZone.local as TimeZone!//set UTC timeZone
        dateFormatterUTC.dateFormat = strOldFormate //set old Format
        if let oldDate:Date = dateFormatterUTC.date(from: strDate)  as Date?//convert date from input string
        {
            dateFormatterUTC.timeZone = NSTimeZone.init(abbreviation: "UTC")! as TimeZone//set localtimeZone
            dateFormatterUTC.dateFormat = strNewFormate //make new dateformatter for output format
            if let strNewDate:String = dateFormatterUTC.string(from: oldDate as Date) as String?//convert dateInUTC into string and set into output
            {
                return strNewDate
            }
            return strDate
        }
        return strDate
    }
    
    //Comparison two date
    static func compare(date:Date, compareDate:Date) -> String{
        var strDateMessage:String = ""
        let result:ComparisonResult = date.compare(compareDate)
        switch result {
        case .orderedAscending:
            strDateMessage = "Future Date"
            break
        case .orderedDescending:
            strDateMessage = "Past Date"
            break
        case .orderedSame:
            strDateMessage = "Same Date"
            break
        default:
            strDateMessage = "Error Date"
            break
        }
        return strDateMessage
    }
}
