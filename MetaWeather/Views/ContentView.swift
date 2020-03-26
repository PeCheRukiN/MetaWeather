//
//  ContentView.swift
//  MetaWeather
//
//  Created by Artem Pecherukin on 15.03.2020.
//  Copyright © 2020 pecherukin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchText: String
    @State private var currentPage = 0
    
    var body: some View {
        
        PagerView(index: $currentPage, maxIndex: 2) {
            NavigationView {
                VStack(spacing: 10) {
                    TextField("Enter location name", text: self.$searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                    
                    NavigationLink(destination: LazyView(LocationsView().environmentObject(LocationsViewModel(query: self.searchText)))) {
                        Text("Find location")
                    }
                    .padding(.horizontal, 16.0)
                    .padding(.vertical, 8)
                    .frame(width: nil)
                    .foregroundColor(.white)
                    .background(/*@START_MENU_TOKEN@*/Color.red/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                }
                .tabItem { Text("Search location") }
                .frame(width: UIScreen.main.bounds.width)
            }
            
            NavigationView {
                WeatherDetailsView()
                    .environmentObject(WeatherDetailsViewModel(locationId: 2122265))
                    .frame(width: UIScreen.main.bounds.width)
                    .tabItem { Text("Moscow") }
            }
            
            NavigationView {
                WeatherDetailsView()
                    .environmentObject(WeatherDetailsViewModel(locationId: 2123260))
                    .frame(width: UIScreen.main.bounds.width)
                    .tabItem { Text("Petersburg") }
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(searchText: "Moscow")
    }
}


extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

public struct LazyView<Content: View>: View {
    private let build: () -> Content
    public init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    public var body: Content {
        build()
    }
}
