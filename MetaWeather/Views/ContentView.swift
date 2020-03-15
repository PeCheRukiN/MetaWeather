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
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter location name", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                
                NavigationLink(destination: LocationsView().environmentObject(LocationsViewModel(query: searchText))) {
                    Text("Find location")
                }
                .padding(.horizontal, 16.0)
                .padding(.vertical, 8)
                .frame(width: nil)
                .foregroundColor(.white)
                .background(/*@START_MENU_TOKEN@*/Color.red/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(searchText: "Moscow")
    }
}