//
//  Struct.swift
//  WallYiOS
//
//  Created by Mihnea on 12/16/22.
//

import Foundation

struct Operation : Identifiable, Codable {
    var id = UUID()
    var amount : Int
    var date = Date()
    var weekDay : String
}

struct UserPrefs : Identifiable, Codable{
    var id = UUID()
    var currency : String = " RON"
    var deleteStatsAfter : Int = 0
    var adviceToggle : Bool = true
}

var userPrefs = Functions.SharedInstance.getPrefs(key: "wallyios.userPrefs")
