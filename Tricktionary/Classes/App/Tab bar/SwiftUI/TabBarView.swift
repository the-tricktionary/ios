//
//  TabBarView.swift
//  Tricktionary
//
//  Created by Marek Štovíček on 22/01/2021.
//  Copyright © 2021 Marek Šťovíček. All rights reserved.
//

import SwiftUI
import Resolver

struct TabBarView: View, Resolving {
    var body: some View {
        
        TabView {
            TrickListView()
                .tabItem {
                    Image("tricktionary")
                    Text("Tricks")
                }
            Text("Here will be speed timer")
                .tabItem {
                    Image("timer")
                    Text("Speed timer")
                }
            
            SpeedDataView()
                .tabItem {
                    Image("data")
                    Text("Speed data")
                }
            
            Text("Here will be submit video")
                .tabItem {
                    Image("submit")
                    Text("Submit")
                }
            
            MenuView()
                .tabItem {
                    Image("settings")
                    Text("Menu")
                }
        }
        .accentColor(.yellow)
    }
}