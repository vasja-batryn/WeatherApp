//
//  CurrentlyWeatherView.swift
//  WeatherApp
//
//  Created by Vasja Batryn on 09.06.2023.
//

import SwiftUI

struct CurrentlyWeatherView: View {
    @StateObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        VStack(spacing: 40) {
            weatherViewModel.getWeatherIconFor(icon: weatherViewModel.weatherIcon)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50, alignment: .center)
            
            Text("\(weatherViewModel.temperature)°")
                .font(.urwdin(size: 65, weight: .bold))
                
            Text(weatherViewModel.conditions)
                .font(.urwdin(size: 20, weight: .bold))
        
            HStack {
                VStack {
                    Text(Constants.Strings.windSpeed)
                        .font(.urwdin(size: 16, weight: .medium))
                    HStack {
                        Image.wind
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20, alignment: .center)
                        Text("\(weatherViewModel.windSpeed)m/s")
                    }
                    .font(.urwdin(size: 15, weight: .medium))
                }
            }
        }
        .padding()
        .foregroundStyle(Color.primaryForeground)
    }
}

struct CurrentlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentlyWeatherView(weatherViewModel: WeatherViewModel())
    }
}
