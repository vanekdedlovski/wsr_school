//
//  ContentView.swift
//  smart WatchKit Extension
//
//  Created by bnkwsr2 on 13.12.2021.
//

import SwiftUI
import Kingfisher
struct ContentView: View {
    @StateObject var mainModule = MainModule()
    @State var screen = "SignLn"
    var body: some View {
        if (screen == "SignLn") {
            SignLn(screen: $screen)
                .environmentObject(mainModule)
        } else if (screen == "MainScreen") {
            MainScreen(screen: $screen)
                .environmentObject(mainModule)
        } else if (screen == "ChatsList") {
            ChatsList(screen: $screen)
                .environmentObject(mainModule)
        } else if (screen == "CompilationScreen") {
            CompilationScreen(screen: $screen)
                .environmentObject(mainModule)
        }else if (screen == "FavoritesScreen") {
            FavoritesScreen(screen: $screen)
                .environmentObject(mainModule)
        }
    }
}

