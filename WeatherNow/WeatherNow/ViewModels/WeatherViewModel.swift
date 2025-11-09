//
//  WeatherViewModel.swift
//  WeatherNow
//
//  Created by Sachin Arkasali on 09/11/25.
//

import Foundation

@MainActor
final class WeatherViewModel: ObservableObject {
    @Published var city: String = ""
    @Published var temperature: String = "--"
    @Published var description: String = ""
    @Published var humidity: String = "--"
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service = WeatherService()

    func fetchWeather() async {
        guard !city.isEmpty else {
            errorMessage = "Please enter a city name"
            return
        }

        isLoading = true
        errorMessage = nil

        do {
            let weather = try await service.fetchWeather(for: city)
            temperature = String(format: "%.1f °C", weather.main.temp)
            description = weather.weather.first?.description.capitalized ?? ""
            humidity = "\(weather.main.humidity)%"
        } catch {
            errorMessage = "Failed to fetch weather. Try again."
        }

        isLoading = false
    }
}

