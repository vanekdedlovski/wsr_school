//
//  ContentView.swift
//  cinema
//
//  Created by bnkwsr2 on 08.12.2021.
//

import SwiftUI

struct ContentView: View {
   @State var screen = "Session1"
    @StateObject var mainModule = MainModule()
    @StateObject var viewModule = ViewModule()
    var body: some View {
        ZStack {
            if (screen == "Session1") {
                Session1(screen:$screen)
                    .environmentObject(mainModule)
                    .environmentObject(viewModule)
            } else if (screen == "Session2") {
                Session2(screen:$screen)
                    .environmentObject(mainModule)
                    .environmentObject(viewModule)
            } else if (screen == "Session3"){
                Session3(screen:$screen)
                    .environmentObject(mainModule)
                    .environmentObject(viewModule)
            }
        }
        .onAppear {
            debugPrint(mainModule.token)
        }

    }
}


