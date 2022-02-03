//
//  ContentView.swift
//  TVSMART
//
//  Created by bnkwsr2 on 16.12.2021.
//

import SwiftUI

struct ContentView: View {
    @State var screen = "SignLn"
    @StateObject var mainModule = MainModule()
    @StateObject var viewModule = ViewModule()
    var body: some View {
        if (screen == "SignLn") {
            SignLn(screen: $screen)
                .environmentObject(mainModule)
                .environmentObject(viewModule)
        } else if (screen == "MainScreen") {
            MainScreen(screen: $screen)
                .environmentObject(mainModule)
                .environmentObject(viewModule)
        }
        else if (screen == "MovieScreen") {
            MovieScreen(screen: $screen)
                .environmentObject(mainModule)
                .environmentObject(viewModule)
        }
    }
}
