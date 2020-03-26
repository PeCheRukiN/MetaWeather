//
//  CitiesListView.swift
//  MetaWeather
//
//  Created by Artem Pecherukin on 15.03.2020.
//  Copyright © 2020 pecherukin. All rights reserved.
//

import SwiftUI

struct LocationsView: View {
    
    @EnvironmentObject var viewModel: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.locations) { location in
                NavigationLink(destination: LazyView(WeatherDetailsView().environmentObject(WeatherDetailsViewModel(locationId: location.id)))) {
                    Text(location.title ?? "Location name displaying error")
                }
            }
        }
    }
}

struct CitiesListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}
