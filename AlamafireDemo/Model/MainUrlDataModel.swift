/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class MainUrlDataModel {
	public var id : Int?
	public var name : String?
	public var username : String?
	public var email : String?
	public var address :  address1?
	public var phone : String?
	public var website : String?
	public var company : Company1?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let json4Swift_Base_list = Json4Swift_Base.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Json4Swift_Base Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [MainUrlDataModel]
    {
        var models:[MainUrlDataModel] = []
        for item in array
        {
            models.append(MainUrlDataModel(dictionary: item as! [String:Any])!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let json4Swift_Base = Json4Swift_Base(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Json4Swift_Base Instance.
*/
    required public init?(dictionary: [String:Any]) {

		id = dictionary["id"] as? Int
		name = dictionary["name"] as? String
		username = dictionary["username"] as? String
		email = dictionary["email"] as? String
        if (dictionary["address"] != nil) {  address =  address1(dictionary: dictionary["address"] as! [String:Any]) }
		phone = dictionary["phone"] as? String
		website = dictionary["website"] as? String
		if (dictionary["company"] != nil) { company = Company1(dictionary: dictionary["company"] as! NSDictionary) }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> [NSDictionary] {

		let dictionary = NSDictionary()

		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.name, forKey: "name")
		dictionary.setValue(self.username, forKey: "username")
		dictionary.setValue(self.email, forKey: "email")
		dictionary.setValue(self.address?.dictionaryRepresentation(), forKey: "address")
		dictionary.setValue(self.phone, forKey: "phone")
		dictionary.setValue(self.website, forKey: "website")
		dictionary.setValue(self.company?.dictionaryRepresentation(), forKey: "company")

        return [dictionary]
	}

}
