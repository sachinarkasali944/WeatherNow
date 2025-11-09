//
//  WeatherService.swift
//  WeatherNow
//
//  Created by Sachin Arkasali on 09/11/25.
//

import Foundation

final class WeatherService {
    private let apiKey = "e5ed6954a81751a6cea262f71b586bab"
    
    func fetchWeather(for city: String) async throws -> WeatherResponse {
        let cityEncoded = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? city
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityEncoded)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(WeatherResponse.self, from: data)
    }
}
