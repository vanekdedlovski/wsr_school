//
//  MainScreen.swift
//  TVSMART
//
//  Created by bnkwsr2 on 16.12.2021.
//

import SwiftUI
import Kingfisher
import Alamofire
struct MainScreen: View {
    @Binding var screen : String
    @EnvironmentObject var mainModule : MainModule
    @EnvironmentObject var viewModule : ViewModule
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                VStack {
                    HStack(spacing: 10) {
                        Spacer()
                        HStack(spacing: 10) {
                            Text("\(mainModule.Users?.firstName ?? "")")
                                .foregroundColor(.white)
                            Text("\(mainModule.Users?.lastName ?? "")")
                                .foregroundColor(.white)

                        }
                        Image("profile")
                            .resizable()
                            .frame(width: 80, height: 80)
                    }
                    .padding(.top,20)
                    .padding(.trailing,10)
                }
                HStack{
                    VStack(alignment: .leading) {
                        Image("name")
                        Button {
                            
                         
                        } label: {
                            Text("Смотреть")
                                .frame(width: 210, height: 60)
                                .foregroundColor(.white)
                                .background(
                                    Color("MyOrange")
                                )
                                .multilineTextAlignment(.center)
                        }
                        .padding(.leading,20)
                        .buttonStyle(PlainButtonStyle())
                    }
                    Spacer()
                }
                HStack {
                    Text("В тренде")
                        .font(.system(size: 44))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(mainModule.Movies1, id: \.movieId) { filter in
                            Button {
                                viewModule.movieId = filter.movieId
                                screen = "MovieScreen"
                            } label: {
                                VStack {
                                    KFImage(URL(string: "http://cinema.areas.su/up/images/\(filter.poster ?? "")"))
                                        .resizable()
                                        .frame(width: 200, height: 320)
                                    Text("\(filter.name)")
                                        .font(.system(size: 18))
                                        .fontWeight(.bold)
                                }
                            }
                            .buttonStyle(PlainButtonStyle())

                        }
                    }
                }
                HStack {
                    Text("Новое")
                        .font(.system(size: 44))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(mainModule.Movies2, id: \.movieId) { filter in
                            Button {
                                viewModule.movieId = filter.movieId
                                screen = "MovieScreen"
                            } label: {
                                VStack {
                                    KFImage(URL(string: "http://cinema.areas.su/up/images/\(filter.poster ?? "")"))
                                        .resizable()
                                        .frame(width: 200, height: 320)
                                    Text("\(filter.name)")
                                        .font(.system(size: 18))
                                        .fontWeight(.bold)
                                }
                            }
                            .buttonStyle(PlainButtonStyle())

                        }
                    }
                }
                HStack {
                    Text("Для вас")
                        .font(.system(size: 44))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(mainModule.Movies3, id: \.movieId) { filter in
                            Button {
                                viewModule.movieId = filter.movieId
                                screen = "MovieScreen"
                            } label: {
                                VStack {
                                    KFImage(URL(string: "http://cinema.areas.su/up/images/\(filter.poster ?? "")"))
                                        .resizable()
                                        .frame(width: 200, height: 320)
                                    Text("\(filter.name)")
                                        .font(.system(size: 18))
                                        .fontWeight(.bold)
                                }
                            }
                            .buttonStyle(PlainButtonStyle())

                        }
                    }
                    
                }
                Spacer()
              
            }
           
            
          
        }
        .padding(.horizontal,20)
        .ignoresSafeArea()
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(
         Image("fontsMain")
        )
        .onAppear(perform: {
            mainModule.getUsers()
            mainModule.GetMovies()
        })
    }
    
}

