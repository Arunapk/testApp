//
//  ClientResponse.swift
//  testApp
//
//  Created by Esakki - iOS on 14/09/25.
//


import Foundation

struct ClientResponse: baseSwiftyJSON {
    let success: Bool
    let message: String
    let errorMessage: String
    let recordCount: [Int]
    let result: [Client]

    init(json: LocalJSONObject) {
        self.success = json["success"].boolValue
        self.message = json["message"].stringValue
        self.errorMessage = json["errorMessage"].stringValue
        self.recordCount = json["recordCount"].arrayObject as? [Int] ?? []

        if let resultsArray = json["result"].arrayObject as? [[String: Any]] {
            self.result = resultsArray.map { Client(json: LocalJSONObject($0)) }
        } else {
            self.result = []
        }
    }
}


struct Client: baseSwiftyJSON {
    let clientID: Int
    let clientName: String
    let logo: String?
    let mobile: String
    let addedByUserID: String
    let userFullName: String
    let enabledStatus: Int
    let clientLoc: ClientLocation?
    let clientDate: String
    let flag: String
    let email: String
    let contactPersonName: String
    let landline: String
    let countryID: Int
    let zoneID: Int
    let stateID: Int
    let cityID: Int
    let pincode: String
    let updateCount: Int
    let retagCount: Int
    let categoryID: Int
    let clientCategoryName: String
    let stageID: Int
    let clientStageName: String
    let city: City?

    init(json: LocalJSONObject) {
        self.clientID = json["clientID"].intValue
        self.clientName = json["clientName"].stringValue
        self.logo = json["logo"].string
        self.mobile = json["mobile"].stringValue
        self.addedByUserID = json["addedByUserID"].stringValue
        self.userFullName = json["userFullName"].stringValue
        self.enabledStatus = json["enabledStatus"].intValue
        self.clientDate = json["clientDate"].stringValue
        self.flag = json["flag"].stringValue
        self.email = json["email"].stringValue
        self.contactPersonName = json["contactPersonName"].stringValue
        self.landline = json["landline"].stringValue
        self.countryID = json["countryID"].intValue
        self.zoneID = json["zoneID"].intValue
        self.stateID = json["stateID"].intValue
        self.cityID = json["cityID"].intValue
        self.pincode = json["pincode"].stringValue
        self.updateCount = json["updateCount"].intValue
        self.retagCount = json["retagCount"].intValue
        self.categoryID = json["categoryID"].intValue
        self.clientCategoryName = json["clientCategoryName"].stringValue
        self.stageID = json["stageID"].intValue
        self.clientStageName = json["clientStageName"].stringValue

        self.clientLoc = json["clientLoc"].exists() ? ClientLocation(json: json["clientLoc"]) : nil
        self.city = json["city"].exists() ? City(json: json["city"]) : nil
    }
}


struct ClientLocation: baseSwiftyJSON {
    let latitude: String
    let longitude: String
    let location: String

    init(json: LocalJSONObject) {
        self.latitude = json["latitude"].stringValue
        self.longitude = json["longitude"].stringValue
        self.location = json["location"].stringValue
    }
}


struct City: baseSwiftyJSON {
    let cityId: Int
    let cityName: String
    let stateId: Int
    let stateName: String
    let countryID: Int
    let countryName: String
    let countryCode: String?
    let zoneId: Int
    let zoneName: String

    init(json: LocalJSONObject) {
        self.cityId = json["cityId"].intValue
        self.cityName = json["cityName"].stringValue
        self.stateId = json["stateId"].intValue
        self.stateName = json["stateName"].stringValue
        self.countryID = json["countryID"].intValue
        self.countryName = json["countryName"].stringValue
        self.countryCode = json["countryCode"].string
        self.zoneId = json["zoneId"].intValue
        self.zoneName = json["zoneName"].stringValue
    }
}

