//
//  ContentView.swift
//  WorldCinema
//
//  Created by bnkwsr2 on 30.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State var screen = "Session1"
    @StateObject var viewModule = ViewModule()
    var body: some View {
        if (screen == "Session1") {
            Session1(screen: $screen)
        } else if (screen == "Session2") {
            Session2(screen: $screen)
                .environmentObject(viewModule)
        } else if (screen == "Session3") {
            Session3(screen : $screen)
                .environmentObject(viewModule)
        }

     
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

