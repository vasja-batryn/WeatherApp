//
//  ContentView.swift
//  WeatherApp
//
//  Created by Vasja Batryn on 09.06.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                SearchCityView(weatherViewModel: weatherViewModel)

                FullWeatherView(weatherViewModel: weatherViewModel)
                    .padding(.top, 20)
            }
            .background(Color.background)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
