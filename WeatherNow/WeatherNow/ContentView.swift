//
//  ContentView.swift
//  WeatherNow
//
//  Created by Sachin Arkasali on 09/11/25.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {

                // MARK: - City TextField
                TextField("Enter city name", text: $viewModel.city)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .submitLabel(.search)
                    .onSubmit {
                        Task {
                            await viewModel.fetchWeather()
                        }
                    }
                
                // MARK: - Search Button
                Button(action: {
                    Task {
                        await viewModel.fetchWeather()
                    }
                }) {
                    Text("Get Weather")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                // MARK: - Loading State
                if viewModel.isLoading {
                    ProgressView("Fetching weather...")
                        .padding()
                }
                
                // MARK: - Weather Info
                VStack(spacing: 10) {
                    Text(viewModel.temperature)
                        .font(.system(size: 48, weight: .bold))
                    
                    Text(viewModel.description)
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    Text("Humidity: \(viewModel.humidity)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                
                // MARK: - Error Message
                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                }

                Spacer()
            }
            .navigationTitle("🌤 WeatherNow")
        }
    }
}

#Preview {
    WeatherView()
}
