//
//  Session2.swift
//  cinema
//
//  Created by bnkwsr2 on 09.12.2021.
//

import SwiftUI
import Kingfisher
struct Session2: View {
   
    @EnvironmentObject var mainModule : MainModule
    @EnvironmentObject var viewModule:ViewModule
    @Binding var screen : String
    @State var activeTab = "main"
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ZStack {
                    KFImage(URL(string: "http://cinema.areas.su/up/images/\(mainModule.Covers?.backgroundImage ?? "")"))
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                    KFImage(URL(string: "http://cinema.areas.su/up/images/\(mainModule.Covers?.foregroundImage ?? "")"))
                        .resizable()
                        .frame(width: 100, height: 100)
                    VStack {
                        Spacer()
                        Button {
                            screen = "Session3"
                            viewModule.movieId = mainModule.Covers?.movieId ?? ""
                        } label: {
                            Text("Смотреть")
                                .frame(width: 134, height: 44)
                                .foregroundColor(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .foregroundColor(Color("MyOrange"))
                                )
                        }

                    }
                    .padding(.bottom,20)
                    
                }
                .onAppear {
                    mainModule.GetCover()
                }
                HStack(spacing: 0) {
                    
                    Button {
                        mainModule.Filter = "inTrend"
                        mainModule.GetMovies()
                    } label: {
                        Text("В тренде")
                            .fontWeight(.heavy)
                            .font(.system(size: 17))
                            .foregroundColor(Color("MyOrange"))
                            .frame(width: UIScreen.main.bounds.width / 3, height: 55)
                            .background(
                                VStack {
                                    if (mainModule.Filter == "inTrend") {
                                        Spacer()
                                        Rectangle()
                                            .foregroundColor(.red)
                                            .frame(height: 5)
                                            
                                    }
                                }
                            )
                            
                    }
                    
                    Spacer()
                    Button {
                        mainModule.Filter = "new"
                        mainModule.GetMovies()
                    } label: {
                        Text("Новое")
                            .fontWeight(.heavy)
                            .font(.system(size: 17))
                            .foregroundColor(Color("MyOrange"))
                            .frame(width: UIScreen.main.bounds.width / 3, height: 55)
                            .background(
                                VStack {
                                    if (mainModule.Filter == "new") {
                                        Spacer()
                                        Rectangle()
                                            .foregroundColor(.red)
                                            .frame(height: 5)
                                            
                                    }
                                }
                            )
                    }
                    Spacer()
                    Button {
                        mainModule.Filter = "forMe"
                        mainModule.GetMovies()
                    } label: {
                        Text("Для Вас")
                            .fontWeight(.heavy)
                            .font(.system(size: 17))
                            .foregroundColor(Color("MyOrange"))
                            .frame(width: UIScreen.main.bounds.width / 3, height: 55)
                            .background(
                                VStack {
                                    if (mainModule.Filter == "forMe") {
                                        Spacer()
                                        Rectangle()
                                            .foregroundColor(.red)
                                            .frame(height: 5)
                                            
                                    }
                                }
                            )
                    }
                  

                }
                .frame(width: UIScreen.main.bounds.width, height: 55)
                .background(
                    Color("fontButton")
                )
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(mainModule.Movies, id: \.movieId) { img in
                            KFImage(URL(string: "http://cinema.areas.su/up/images/\(img.poster)"))
                                
                                .resizable()
                                .frame(width: 100, height: 144)
                                .onTapGesture(perform: {
                                    viewModule.movieId = img.movieId
                                    withAnimation {
                                        screen = "Session3"
                                    }
                                })
                        }
                    }
                    .onAppear {
                        mainModule.GetMovies()
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 20)
                .padding(.top,5)
                HStack {
                    Text("Вы cмотрели")
                        .fontWeight(.heavy)
                        .font(.system(size: 24))
                        .foregroundColor(Color("MyOrange"))
                        .padding(.leading,20)
                    Spacer()
                }
                .padding(.vertical,10)
                ZStack {
                    KFImage(URL(string: "http://cinema.areas.su/up/images/\(mainModule.movie?.poster ?? "")"))
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: 240)
                    Button {
                        viewModule.movieId = mainModule.movie?.movieId ?? ""
                        withAnimation(.spring()) {
                            screen = "Session3"
                        }
                    } label: {
                        Image(systemName: "play.fill")
                            .resizable()
                            .frame(width: 64, height: 64)
                            .foregroundColor(Color("MyOrange"))
                    }
                    VStack {
                        Spacer()
                        HStack {
                            Text("\(mainModule.movie?.name ?? "")")
                                .foregroundColor(.white)
                                .font(.system(size: 14))
                                .fontWeight(.heavy)
                                .padding(.leading,10)
                                .padding(.bottom,10)
                            Spacer()
                        }
                    }

                }
                .onAppear {
                    mainModule.GetUsersMovies()
                }
                
            }
            
           
        }
        .overlay(
            HStack {
                Spacer()
                Button {
                    activeTab = "main"
                } label: {
                    VStack{
                        Image(activeTab == "main" ? "tv-active" : "tv" )
                        Text("Главное")
                            .foregroundColor(.gray)
                            .font(.system(size: 10))
                    }
                }
                Spacer()
                Button {
                    activeTab = "Vector"
                } label: {
                    VStack{
                        Image(activeTab == "Vector" ? "Vector-active" : "Vector" )
                        Text("Подборка")
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                            
                    }
                }
                Spacer()
                Button {
                    activeTab = "collection"
                } label: {
                    VStack{
                        Image(activeTab == "collection" ? "collection-active" : "collection" )
                        Text("Коллекция")
                            .foregroundColor(.gray)
                            .font(.system(size: 10))
                    }
                }
                Spacer()
                Button {
                    activeTab = "profile"
                } label: {
                    VStack{
                        Image(activeTab == "profile" ? "profile-active" : "profile" )
                        Text("Профиль")
                            .foregroundColor(.gray)
                            .font(.system(size: 10))
                    }
                }
                Spacer()

            }
                .frame(width: UIScreen.main.bounds.width, height: 65)
            .background(
            Color("overlay"))
            , alignment: .bottom
        )
        .background(
            Color("fonts")
        )
        .ignoresSafeArea()
    }
}

