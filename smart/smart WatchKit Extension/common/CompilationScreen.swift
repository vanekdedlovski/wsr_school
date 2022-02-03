//
//  CompilationScreen.swift
//  smart WatchKit Extension
//
//  Created by bnkwsr2 on 14.12.2021.
//

import SwiftUI
import Kingfisher
import Alamofire
import SwiftyJSON

struct CompilationScreen: View {
    @Binding var screen : String
    @EnvironmentObject var mainModule : MainModule
    @State var activeTab = ""
    @State var activeTab2 = ""
    @State var tabViewSelection = 0
    
    @State var favoritesMovies : [Movie] = []
    
    var body: some View {
        ZStack {
         
            VStack {
                TabView(selection: $tabViewSelection) {
                    ForEach(mainModule.Movies, id: \.movieId) { filter in
                        VStack {
                            Spacer()
                            KFImage(URL(string: "http://cinema.areas.su/up/images/\(filter.poster ?? "")"))
                                .resizable()
                                .frame(width: 100, height: 100)
                    }
                }
            }
            .onAppear {
                mainModule.GetUsersMovies()
                
                do {
                    favoritesMovies = try JSONDecoder().decode([Movie].self, from: UserDefaults.standard.data(forKey: "favorites") ?? Data())
                } catch {
                    favoritesMovies = []
                }

            }
                VStack {
                    HStack {
                        Button {
                            withAnimation {
                                screen = "MainScreen"
                            }
                        } label: {
                            Text("Cancel")
                                .padding(.top,10)
                                .padding(.leading,10)
                                .font(.system(size: 16))
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                        Spacer()
                    }
                    Spacer()
                }
           
        }
        .frame(width: WKInterfaceDevice.current().screenBounds.width, height: WKInterfaceDevice.current().screenBounds.height)
        
    }
        .ignoresSafeArea()
        .background(
            Color("fonts")
        )
}
}
