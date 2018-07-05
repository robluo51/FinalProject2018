//
//  ReviewData.swift
//  FinalProject2018
//
//  Created by User02 on 2018/6/30.
//  Copyright © 2018年 User02. All rights reserved.
//

import Foundation

struct ReviewData: Codable{
    var title: String
    var review: String
    
    static func saveToFile(myData: [ReviewData]){
        let propertyEncoder = PropertyListEncoder()
        if let data = try? propertyEncoder.encode(myData) {UserDefaults.standard.setValue(data, forKey: "myData")
            
        }
    }
    
    static func readCollectionFromFile() -> [ReviewData]? {
        let propertyDecoder = PropertyListDecoder()
        if let data = UserDefaults.standard.data(forKey: "myData"),let myData = try? propertyDecoder.decode([ReviewData].self, from: data) {
            return myData
            
        } else {
            return nil
        }
    }
}
