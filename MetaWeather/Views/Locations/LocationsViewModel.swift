//
//  LocationsViewModel.swift
//  MetaWeather
//
//  Created by Artem Pecherukin on 22.03.2020.
//  Copyright © 2020 pecherukin. All rights reserved.
//

import SwiftUI

final class LocationsViewModel: ObservableObject {
    
    @Published private(set) var locations: [Location] = []
    
    init(query: String) {
        SearchLocationAPI.searchLocationByName(query: query) { [weak self] locations, error in
            if let locations = locations {
                self?.locations = locations
            } else if let error = error {
                print(error)
            }
        }
    }
}
