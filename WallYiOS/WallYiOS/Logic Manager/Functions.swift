//
//  Functions.swift
//  WallYiOS
//
//  Created by Mihnea on 12/16/22.
//

import Foundation

class Functions {
    static let SharedInstance = Functions()
    
    private init() {}
    
    public func getData(key: String) -> [Operation] {
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                let decoder = JSONDecoder()
                return try decoder.decode([Operation].self, from: data)
            } catch {
                print("Unable to Decode Reminders ((error))")
                return [Operation]()
            }
        }
        return [Operation]()
    }
    
    public func saveData(key: String, array : [Operation]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(array)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("Unable to Encode Array of Reminders ((error))")
        }
    }
}
