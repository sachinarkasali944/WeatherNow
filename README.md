# 🌤 WeatherNow

WeatherNow is a simple SwiftUI app that displays real-time weather information for any city using the **OpenWeatherMap API**.  
Built with **SwiftUI**, **MVVM architecture**, and **async/await** networking.

---

## 🚀 Features

- Search for weather by city name  
- Real-time weather data (temperature, humidity, condition)  
- Clean SwiftUI interface  
- Asynchronous networking using `URLSession` and `async/await`  
- Proper error handling and loading states  

---

## 🧱 Architecture

WeatherNow follows the **MVVM (Model-View-ViewModel)** design pattern:

WeatherNow/
┣ Models/
┃ ┗ WeatherModel.swift
┣ Services/
┃ ┗ WeatherService.swift
┣ ViewModels/
┃ ┗ WeatherViewModel.swift
┣ Views/
┃ ┗ WeatherView.swift
┗ WeatherNowApp.swift
