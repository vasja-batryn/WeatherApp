//
//  DailyView.swift
//  WeatherApp
//
//  Created by Vasja Batryn on 09.06.2023.
//

import SwiftUI

struct DailyView: View {
    @StateObject var weatherViewModel: WeatherViewModel

    var body: some View {
        ForEach(weatherViewModel.weather.daily) { weather in
            LazyVStack {
                DailyWeatherCell(weather: weather)
            }
        }
    }

    private func DailyWeatherCell(weather: WeatherDaily) -> some View {
        HStack {
            HStack {
                Text("\(weatherViewModel.getDayFor(weather.date)), \(weatherViewModel.getDayNumber(weather.date))")
            }
            
            Spacer()
            
            weatherViewModel.getWeatherIconFor(icon: weather.weather[0].icon)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30, alignment: .center)
            
            Spacer()
            
            HStack {
                Text("\(weatherViewModel.getTempFor(weather.temperature.min))° \(weatherViewModel.getTempFor(weather.temperature.max))°")
            }
        }
        .font(.urwdin(size: 20, weight: .regular))
        .foregroundStyle(Color.primaryForeground)
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView(weatherViewModel: WeatherViewModel())
    }
}
