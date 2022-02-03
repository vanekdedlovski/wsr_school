//
//  ContentView.swift
//  ozon
//
//  Created by bnkwsr2 on 13.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State var screen = "Screen1"
    @StateObject var mainModule = MainModule()
    var body: some View {
        if (screen == "Screen1") {
            Screen1(screen: $screen)
                .environmentObject(mainModule)
        } else if (screen == "Screen2") {
            Screen2(screen: $screen)
                .environmentObject(mainModule)
        }
        else if (screen == "Screen3") {
            Screen3(screen: $screen)
                .environmentObject(mainModule)
        }
}
}

