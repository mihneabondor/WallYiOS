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

struct UserPrefs {
    var currency : String = "RON"
}
