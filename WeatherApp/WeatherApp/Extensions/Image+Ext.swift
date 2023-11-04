//
//  Image+Ext.swift
//  WeatherApp
//
//  Created by Vasja Batryn on 09.06.2023.
//

import SwiftUI

// MARK: - Constants
extension Image {
        
    // Weather
    static let clearSky = Image(systemName: "sun.max")
    static let clearSkyNight = Image(systemName: "moon")
    static let fewClouds = Image(systemName: "cloud.sun")
    static let fewCloudsNight = Image(systemName: "cloud.moon")
    static let scatteredClouds = Image(systemName: "cloud")
    static let brokenClouds = Image(systemName: "smoke")
    static let showerRain = Image(systemName: "cloud.rain")
    static let rain = Image(systemName: "cloud.sun.rain")
    static let rainNight = Image(systemName: "cloud.moon.rain")
    static let thunderstorm = Image(systemName: "cloud.bolt.rain")
    static let snow = Image(systemName: "cloud.snow")
    static let mist = Image(systemName: "cloud.fog")
    static let wind = Image(systemName: "wind")
    static let search = Image(systemName: "magnifyingglass")
}
