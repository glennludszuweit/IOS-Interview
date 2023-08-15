//
//  Weather.swift
//  Weather
//
//  Created by Glenn Ludszuweit on 15/08/2023.
//

import Foundation

import Foundation

struct Weather: Codable {
    let timelines: Timelines
    let location: CurrentLocation
}

struct CurrentLocation: Codable {
    let lat, lon: Double
}

struct Timelines: Codable {
    let daily: [Daily]
}

struct Daily: Codable {
    let time: String
    let values: Values
}

struct Values: Codable {
    let moonriseTime, moonsetTime: String
    let sunriseTime, sunsetTime: String
    let temperatureAvg: Double
    let temperatureMax, temperatureMin: Double
}
