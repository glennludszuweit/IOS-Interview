//
//  Weather.swift
//  Weather
//
//  Created by Glenn Ludszuweit on 15/08/2023.
//

import Foundation

import Foundation

struct Weather: Codable {
//    let timelines: Timelines?
    let location: CurrentLocation?
}

struct CurrentLocation: Codable {
    let lat, lon: Double?
    let name, type: String?
}

struct Timelines: Codable {
    let daily: [Daily]?
}

struct Daily: Codable {
    let time: Date?
    let values: Values?
}

struct Values: Codable {
    let cloudBaseAvg, cloudBaseMax, cloudBaseMin, cloudCeilingAvg: Double?
    let cloudCeilingMax: Double?
    let cloudCeilingMin: Int?
    let cloudCoverAvg, cloudCoverMax, cloudCoverMin, dewPointAvg: Double?
    let dewPointMax, dewPointMin, evapotranspirationAvg, evapotranspirationMax: Double?
    let evapotranspirationMin, evapotranspirationSum: Double?
    let freezingRainIntensityAvg, freezingRainIntensityMax, freezingRainIntensityMin: Int?
    let humidityAvg, humidityMax, humidityMin: Double?
    let iceAccumulationAvg, iceAccumulationLweAvg, iceAccumulationLweMax, iceAccumulationLweMin: Int?
    let iceAccumulationLweSum, iceAccumulationMax, iceAccumulationMin, iceAccumulationSum: Int?
    let moonriseTime: Date?
    let moonsetTime: Date?
    let precipitationProbabilityAvg: Double?
    let precipitationProbabilityMax, precipitationProbabilityMin: Int?
    let pressureSurfaceLevelAvg, pressureSurfaceLevelMax, pressureSurfaceLevelMin, rainAccumulationAvg: Double?
    let rainAccumulationLweAvg, rainAccumulationLweMax: Double?
    let rainAccumulationLweMin: Int?
    let rainAccumulationMax: Double?
    let rainAccumulationMin: Int?
    let rainAccumulationSum, rainIntensityAvg, rainIntensityMax: Double?
    let rainIntensityMin, sleetAccumulationAvg, sleetAccumulationLweAvg, sleetAccumulationLweMax: Int?
    let sleetAccumulationLweMin, sleetAccumulationLweSum, sleetAccumulationMax, sleetAccumulationMin: Int?
    let sleetIntensityAvg, sleetIntensityMax, sleetIntensityMin, snowAccumulationAvg: Int?
    let snowAccumulationLweAvg, snowAccumulationLweMax, snowAccumulationLweMin, snowAccumulationLweSum: Int?
    let snowAccumulationMax, snowAccumulationMin, snowAccumulationSum, snowDepthAvg: Int?
    let snowDepthMax, snowDepthMin, snowDepthSum, snowIntensityAvg: Int?
    let snowIntensityMax, snowIntensityMin: Int?
    let sunriseTime, sunsetTime: Date?
    let temperatureApparentAvg, temperatureApparentMax, temperatureApparentMin, temperatureAvg: Double?
    let temperatureMax, temperatureMin: Double?
    let uvHealthConcernAvg, uvHealthConcernMax, uvHealthConcernMin, uvIndexAvg: Int?
    let uvIndexMax, uvIndexMin: Int?
    let visibilityAvg, visibilityMax, visibilityMin: Double?
    let weatherCodeMax, weatherCodeMin: Int?
    let windDirectionAvg, windGustAvg, windGustMax, windGustMin: Double?
    let windSpeedAvg, windSpeedMax, windSpeedMin: Double?
}
