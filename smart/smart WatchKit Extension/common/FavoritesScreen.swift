//
//  FavoritesScreen.swift
//  smart WatchKit Extension
//
//  Created by bnkwsr2 on 15.12.2021.
//

import SwiftUI
import Kingfisher

struct FavoritesScreen: View {
    @Binding var screen : String
    @State var favoritesMovies : [Movie]?
    @EnvironmentObject var mainModule : MainModule
    var body: some View {
        VStack {
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
               
            }
            VStack {
                ScrollView(.vertical) {
                    ForEach(favoritesMovies ?? [], id: \.movieId) { fil in
                        KFImage(URL(string: "http://cinema.areas.su/up/images/\(fil.poster)"))
                            .resizable()
                            .frame(width: 150 , height: 150)
                        Text("\(fil.name)")
                        Button {
                            withAnimation {
                                favoritesMovies = favoritesMovies?.filter(){$0.movieId != fil.movieId}
                            }
                        } label: {
                            VStack {
                                Image("activeHeart")
                                    .background(
                                        Circle()
                                        .foregroundColor(Color("MyOrange"))
                                        .frame(width: 40, height: 40)
                                    )
                                Text("Удалить")
                                    .font(.system(size: 9))
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            Spacer()
        }
        .ignoresSafeArea()
        .background(
            Color("fonts")
        )
        .onAppear {
            favoritesMovies = try? JSONDecoder().decode([Movie].self, from: UserDefaults.standard.data(forKey: "favorites") ?? Data())
            debugPrint(favoritesMovies)
        }
    }
}
