//
//  WeatherResponse.swift
//  WeatherNow
//
//  Created by Sachin Arkasali on 09/11/25.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
    let humidity: Int
}

struct Weather: Decodable {
    let description: String
}
