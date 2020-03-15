//
//  WeatherDetailsView.swift
//  MetaWeather
//
//  Created by Artem Pecherukin on 15.03.2020.
//  Copyright © 2020 pecherukin. All rights reserved.
//

import SwiftUI

final class WeatherDetailsViewModel: ObservableObject {
    
    @Published var weather: LocationWeather?
    
    init(locationId: Int) {
        GetLocationDataAPI.getLocationData(woeid: "\(locationId)") { [weak self] (locationWeather, error) in
            if let weather = locationWeather {
                self?.weather = weather
            } else if let error = error {
                print(error)
            }
        }
    }
}

struct WeatherDetailsView: View {
    
    @EnvironmentObject var viewModel: WeatherDetailsViewModel
    
    var body: some View {
        Group {
            Text(viewModel.weather?.consolidatedWeather?.first?.weatherStateName ?? "")
            Text("Temperature: \(viewModel.weather?.consolidatedWeather?.first?.theTemp ?? 0) ℃")
            Text("Max temperature: \(viewModel.weather?.consolidatedWeather?.first?.maxTemp ?? 0) ℃")
            Text("Min temperature: \(viewModel.weather?.consolidatedWeather?.first?.minTemp ?? 0) ℃")
            Text("Air pressure: \(viewModel.weather?.consolidatedWeather?.first?.airPressure ?? 0) Pa")
            Text("Humidity: \(viewModel.weather?.consolidatedWeather?.first?.humidity ?? 0)")
            Text("Wind spped: \(viewModel.weather?.consolidatedWeather?.first?.windSpeed ?? 0)")
        }
        .navigationBarTitle(viewModel.weather?.title ?? "Location title displaying error")
    }
}

struct WeatherDetails_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailsView()
    }
}
