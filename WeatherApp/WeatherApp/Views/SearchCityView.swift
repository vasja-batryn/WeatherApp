//
//  SearchCityView.swift
//  WeatherApp
//
//  Created by Vasja Batryn on 09.06.2023.
//

import SwiftUI

struct SearchCityView: View {
    @ObservedObject var weatherViewModel: WeatherViewModel
    @State private var startCity = Constants.Strings.city

    var body: some View {
        HStack {
            Button {
                weatherViewModel.getCurrentLocationWeather()
                startCity = weatherViewModel.city
            } label: {
                Image(systemName: "location")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            }

            Spacer()

            TextField("", text: $startCity)
                .padding()
                .font(.urwdin(size: 20, weight: .medium))
                .multilineTextAlignment(.center)

            Spacer()

            Button {
                weatherViewModel.city = startCity
            } label: {
                Image.search.resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            }
        }
        .foregroundColor(.primaryForeground)
        .padding()
    }
}

struct SearchCityView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
