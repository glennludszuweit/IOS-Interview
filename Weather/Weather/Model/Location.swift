//
//  Location.swift
//  Weather
//
//  Created by Glenn Ludszuweit on 15/08/2023.
//

import Foundation
import CoreLocation

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
