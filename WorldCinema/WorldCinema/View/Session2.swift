//
//  Session2.swift
//  WorldCinema
//
//  Created by bnkwsr2 on 01.12.2021.
//

import SwiftUI
import Kingfisher

struct Session2: View {
    @StateObject var mainModule = MainModule()
    @Binding var screen : String
    @EnvironmentObject var viewmodule:ViewModule
    var body: some View {
        ScrollView(.vertical) {
            ZStack{
                KFImage(URL(string: "http://cinema.areas.su/up/images/kinopoisk.ru-The-Lion-King-3351468.jpg"))
                    .resizable()
                    .frame(height: UIScreen.main.bounds.height / 2)
                VStack {
                    Spacer()
                    KFImage(URL(string: "http://cinema.areas.su/up/images/magicians.png"))
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width / 2, height: 200)
                    Spacer()
                    Button {
                        mainModule.GetCover()
                        withAnimation {
                            screen = "Session3"
                        }
                    } label: {
                        Text("Cмотреть")
                            .background(
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color("MyOrange"))
                                .frame(width: 134, height: 44)
                            )
                            .foregroundColor(.white)
                            .padding(.bottom,50)
                    }
                }
            }
            HStack(spacing: 0) {
                Button {
                    mainModule.filter = "inTrend"
                    mainModule.GetMovies()
                } label: {
                        Text("**В тренде**")
                            .foregroundColor(Color("MyOrange"))
                            .frame(width: UIScreen.main.bounds.width / 3, height: 55)
                            .background(
                                VStack {
                                    if (mainModule.filter == "inTrend") {
                                        Spacer()
                                        Rectangle()
                                            .frame(width: UIScreen.main.bounds.width / 3, height: 4)
                                            .foregroundColor(Color("MyOrange"))
                                    }
                                   
                                }
                            )
                }
                Spacer()
                Button {
                    mainModule.filter = "new"
                    mainModule.GetMovies()
                } label: {
                    Text("**Новое**")
                        .foregroundColor(Color("MyOrange"))
                        .frame(width: UIScreen.main.bounds.width / 3, height: 55)
                        .background(
                            VStack {
                                if (mainModule.filter == "new") {
                                    Spacer()
                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width / 3, height: 4)
                                        .foregroundColor(Color("MyOrange"))
                                }
                                
                            }
                        )

                }
                Spacer()
                Button {
                    mainModule.filter = "forMe"
                    mainModule.GetMovies()
                } label: {
                    Text("**Для вас**")
                        .foregroundColor(Color("MyOrange"))
                        .frame(width: UIScreen.main.bounds.width / 3, height: 55)
                        .background(
                            VStack {
                                if (mainModule.filter == "forMe") {
                                    Spacer()
                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width / 3, height: 4)
                                        .foregroundColor(Color("MyOrange"))
                                }
                                
                            }
                        )

                }

            }
            .font(.system(size: 17))
            .frame(width: UIScreen.main.bounds.width, height: 55)
            .background(
                    Color("ColorButton")
                )
            ScrollView(.horizontal) {
                HStack{
                    ForEach(mainModule.Filters, id:\.movieId) { filter in
                        KFImage(URL(string: "http://cinema.areas.su/up/images/\(filter.poster)"))
                            .resizable()
                            .frame(width: 100, height: 144)
                            .padding(.leading,15)
                            .onTapGesture {
                                viewmodule.currentMovie = filter
                                screen = "Session3"
                            }
                    }
                }
                .onAppear {
                    mainModule.GetMovies()
                }
            }
            .padding(.top,15)
            .padding(.horizontal,5)
            HStack {
                Text("**Вы смотрели**")
                    .padding(.leading,20)
                    .font(.system(size: 24))
                    .foregroundColor(Color("MyOrange"))
                Spacer()
            }
            ZStack {
                KFImage(URL(string: "http://cinema.areas.su/up/images/\(mainModule.movie?.poster ?? "")"))
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: 240)
                Image(systemName: "play.fill")
                    .resizable()
                    .frame(width: 64, height: 64)
                    .foregroundColor(Color("MyOrange"))
                   
            }
            .onAppear {
                mainModule.GetLast()
            }
           
            
        }
        .overlay(
            HStack(alignment: .bottom) {
                Spacer()
                Button {
                    
                } label: {
                    VStack {
                        Spacer()
                        Image("tv")
                            .frame(width: 25, height: 25)
                        Text("Главное")
                            .font(.system(size: 12))
                            .foregroundColor(Color(.gray))
                        Spacer()
                    }
                }
                Spacer()
                Button {
                    
                } label: {
                    VStack {
                        Spacer()
                        Image("podborka")
                            .frame(width: 25, height: 25)
                        
                        Text("Подборка")
                            .font(.system(size: 12))
                            .foregroundColor(Color(.gray))
                        Spacer()
                    }
                }
                Spacer()
                Button {
                    
                } label: {
                    VStack {
                        Spacer()
                        Image("collection")
                            .frame(width: 25, height: 25)
                        Text("Коллекция")
                            .font(.system(size: 12))
                            .foregroundColor(Color(.gray))
                        Spacer()
                    }
                }
                Spacer()
                Button {
                    
                } label: {
                    VStack {
                        Spacer()
                        Image("profile")
                            .frame(width: 25, height: 25)
                        Text("Профиль")
                            .font(.system(size: 12))
                            .foregroundColor(Color(.gray))
                        Spacer()
                    }
                }
                Spacer()

            }
            .background(
                Color("fonblack")
            )
                .frame(width: UIScreen.main.bounds.width, height: 85), alignment: .bottom)
        .background(
            Color("fonts")
        )
        .ignoresSafeArea()
    }
}

