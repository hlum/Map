//
//  SwiftUIMapAppApp.swift
//  SwiftUIMapApp
//
//  Created by Hlwan Aung Phyo on 2024/06/18.
//

import SwiftUI

@main
struct SwiftUIMapAppApp: App {
    @StateObject private var vm = LocationViewModel()
    var body: some Scene {
        WindowGroup {
            LocationView()
        }
        .environmentObject(vm)
    }
}
