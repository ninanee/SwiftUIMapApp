//
//  SwiftUIMapAppApp.swift
//  SwiftUIMapApp
//
//  Created by Yun Ni on 2024-07-16.
//

import SwiftUI

@main
struct SwiftUIMapAppApp: App {
    
    @State private var vm = LocationsViewModel()

    var body: some Scene {
        WindowGroup {
//            ContentView()
            LocationView()
                .environmentObject(vm)
        }
    }
}
