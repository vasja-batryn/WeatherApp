//
//  FullWeatherView.swift
//  WeatherApp
//
//  Created by Vasja Batryn on 09.06.2023.
//

import SwiftUI

struct FullWeatherView: View {
    @StateObject var weatherViewModel: WeatherViewModel

    var body: some View {
        VStack {
            CurrentlyWeatherView(weatherViewModel: weatherViewModel)
                .padding()

            ScrollView(showsIndicators: false) {
                DailyView(weatherViewModel: weatherViewModel)
                    .padding(.horizontal)
            }
        }
    }
}

struct FullWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        FullWeatherView(weatherViewModel: WeatherViewModel())
    }
}
