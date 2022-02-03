//
//  Session3.swift
//  WorldCinema
//
//  Created by bnkwsr2 on 07.12.2021.
//

import SwiftUI
import Kingfisher
import simd

struct Session3: View {
    @Binding var screen : String
    @StateObject var mainModule = MainModule()
    @EnvironmentObject var viewmodule:ViewModule
    var body: some View {
        ScrollView(.vertical) {
            ZStack {
                KFImage(URL(string: "http://cinema.areas.su/up/images/\(viewmodule.currentMovie?.poster ?? "")"))
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
                VStack {
                    HStack {
                        Button {
                            withAnimation {
                                screen = "Session2"
                            }
                        } label: {
                            Image("arrow")
                        }
                        Spacer()
                        Text("**\(viewmodule.currentMovie?.name ?? "")**")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                        Spacer()
                        Image("18+")
                            .resizable()
                            .frame(width: 30, height: 22)
                        Button {
                            
                        } label: {
                            Image("chats")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }

                        
                    }
                    .padding(.top,40)
                    Spacer()
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewmodule.currentMovie?.tags ?? [], id: \.idTags) { tag in
                                   Text("\(tag.tagName)")
                                    .foregroundColor(.white)
                                    .padding(.horizontal,10)
                                    .padding(.vertical, 5)
                                    .background(
                                    RoundedRectangle(cornerRadius: 3)
                                        .foregroundColor(Color("MyOrange"))
                                    )
                               }
                        }
                    }
                    .padding(.bottom,15)
                    
                    
                }
            }
            VStack {
                HStack{
                    Text("**Смотреть**")
                        .padding(.leading,20)
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                    Spacer()
                }
                
                
                
                HStack{
                    Text("**Описание**")
                        .padding(.leading,20)
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                    Spacer()
                    
                }
                .padding(.bottom,10)
                
                Text("**\(viewmodule.currentMovie?.description ?? "")**")
                    .foregroundColor(.white)
                    .padding(.leading,20)
                HStack{
                    Text("**Кадры**")
                        .padding(.leading,20)
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                    Spacer()
                    
                }
                .padding(.top,10)
                ScrollView(.horizontal) {
                    HStack(spacing: 15) {
                        ForEach(viewmodule.currentMovie?.images ?? [], id:\.self) { img in
                            KFImage(URL(string: "http://cinema.areas.su/up/images/\(img)"))
                                .resizable()
                                .frame(width: 128, height: 72)
                        }
                    }
                    .padding(.horizontal,15)
                }
                HStack{
                    Text("**Эпизоды**")
                        .padding(.leading,20)
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                    Spacer()
                    
                }
                .padding(.top,10)
                VStack {
                        ForEach(mainModule.Episodes, id: \.episodeId) { episode in
                            HStack {
                                KFImage(URL(string: "http://cinema.areas.su/up/images/\(episode.images?.last ?? "")"))
                                    .resizable()
                                    .frame(width: 128, height: 72)
                                VStack {
                                    Text("**\(episode.name)**")
                                        .font(.system(size: 16))
                                        .foregroundColor(.white)
                                    Text("\(episode.description)")
                                        .padding(.vertical,3)
                                        .font(.system(size: 12))
                                        .lineLimit(2)
                                        .foregroundColor(Color("Color1"))
                                    Text("\(episode.year)")
                                        .foregroundColor(Color("Color1"))
                                        .font(.system(size: 12))
                                }
                            }
                            
                        }
                }
                .padding(.horizontal,10)
                
                
            }
            .onAppear {
                mainModule.GetEpisode()
            }
        }
        .background(
            Color("fonts")
        )
        .ignoresSafeArea()
    }
}

