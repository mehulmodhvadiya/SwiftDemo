//
//  Project.swift
//  AlamafireDemo
//
//  Created by Verve Mac on 21/09/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import Foundation
import ObjectMapper

class Project: NSObject, Mappable {
    
    var projectId: Int?
    var accountId: Int?
    var dateCreated: Int?
    var dateModified: Int?
    var name: String?
    var status: String?
    
    override init() {
        super.init()
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        projectId <- map["id"]
        accountId <- map["account_id"]
        dateCreated <- map["date_created"]
        dateModified <- map["date_modified"]
        name <- map["name"]
        status <- map["status"]
    }
    
}
