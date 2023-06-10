//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Vasja Batryn on 09.06.2023.
//

import CoreLocation
import SwiftUI

final class WeatherViewModel: ObservableObject {
    @Published var weather = WeatherResponse.empty()
    @Published var city = Constants.Strings.city {
        didSet {
            getLocation()
        }
    }

    init() {
        getLocation()
    }

    private func getLocation() {
        CLGeocoder().geocodeAddressString(city) { placemarks, _ in
            if let places = placemarks,
               let place = places.first
            {
                self.getWeather(coord: place.location?.coordinate)
            }
        }
    }
    
    func getCurrentLocationWeather() {
        let locationManager = CLLocationManager()

        if locationManager.authorizationStatus == .authorizedWhenInUse {
            guard let currentLocation = locationManager.location else {
                
                return
            }
            
            let latitude = currentLocation.coordinate.latitude
            let longitude = currentLocation.coordinate.longitude
            let urlString = WeatherApi.getCurrentWeatherURL(latitude: latitude, longitude: longitude)
            
            getWeatherInternal(city: "Current Location", for: urlString)
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }



    private func getWeather(coord: CLLocationCoordinate2D?) {
        var urlString = ""
        if let coord = coord {
            urlString = WeatherApi.getCurrentWeatherURL(latitude: coord.latitude, longitude: coord.longitude)
        } else {
            urlString = WeatherApi.getCurrentWeatherURL(latitude: 48.546504, longitude: 22.987667)
        }
        getWeatherInternal(city: city, for: urlString)
    }

    private func getWeatherInternal(city: String, for urlString: String) {
        guard let url = URL(string: urlString) else { return }
        NetworkManager<WeatherResponse>.fetchWeather(for: url) { result in
            switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self.weather = response
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }

    var date: String {
        return Time.defaultDateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.date)))
    }

    var weatherIcon: String {
        return weather.current.weather.first?.icon ?? "sun"
    }

    var temperature: String {
        return getTempFor(weather.current.temperature)
    }

    var conditions: String {
        return weather.current.weather.first?.main ?? ""
    }

    var windSpeed: String {
        return String(format: "%0.1f", weather.current.windSpeed)
    }

    var humidity: String {
        return String(format: "%d%%", weather.current.humidity)
    }

    var rainChances: String {
        return String(format: "%0.1f%%", weather.current.dewPoint)
    }

    func getTimeFor(_ temp: Int) -> String {
        return Time.timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(temp)))
    }

    func getDayFor(_ temp: Int) -> String {
        return Time.dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(temp)))
    }

    func getDayNumber(_ temp: Int) -> String {
        return Time.dayNumberFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(temp)))
    }

    func getTempFor(_ temp: Double) -> String {
        return String(format: "%1.0f", temp)
    }

    func getWeatherIconFor(icon: String) -> Image {
        switch icon {
            case "01d":
                return Image.clearSky
            case "01n":
                return Image.clearSkyNight
            case "02d":
                return Image.fewClouds
            case "02n":
                return Image.fewCloudsNight
            case "03d":
                return Image.scatteredClouds
            case "03n":
                return Image.scatteredClouds
            case "04d":
                return Image.brokenClouds
            case "04n":
                return Image.brokenClouds
            case "09d":
                return Image.showerRain
            case "09n":
                return Image.showerRain
            case "10d":
                return Image.rain
            case "10n":
                return Image.rainNight
            case "11d":
                return Image.thunderstorm
            case "11n":
                return Image.thunderstorm
            case "13d":
                return Image.snow
            case "13n":
                return Image.snow
            case "50d":
                return Image.mist
            case "50n":
                return Image.mist
            default:
                return Image.clearSky
        }
    }
}
