//
//  APIServices.swift
//  Weather
//
//  Created by Glenn Ludszuweit on 15/08/2023.
//

import Foundation

class APIServices {
    
        
    static var tomorrowAPIKey: String {
        var key: String = ""
        if let path = Bundle.main.path(forResource: "API", ofType: "plist"),
           let xml = FileManager.default.contents(atPath: path) {
            do {
                let plistData = try PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)
                if let plistDict = plistData as? [String: Any] {
                    key = plistDict["TOMORROW-KEY"] as! String
                }
            } catch {
                print("Error loading plist: \(error.localizedDescription)")
            }
        }
        
        return key
    }
    
    static let weeatherAPI: String = "https://api.tomorrow.io/v4/weather/forecast?timesteps=1d&units=metric"
}
