//
//  Session3.swift
//  cinema
//
//  Created by bnkwsr2 on 09.12.2021.
//

import SwiftUI
import Kingfisher
import AVKit
struct Session3: View {
    @Binding var screen : String
    @EnvironmentObject var viewModule:ViewModule
    @EnvironmentObject var mainModule : MainModule
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ZStack {
                    KFImage(URL(string: "http://cinema.areas.su/up/images/\(viewModule.CurrentMovie?.poster ?? "")"))
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                    VStack {
                        HStack {
                            
                            Button {
                                withAnimation {
                                    screen = "Session2"
                                }
                            } label: {
                                Image("arrow")
                                    .resizable()
                                    .frame(width: 34, height: 44)
                            }
                            Spacer()
                            Text("\(viewModule.CurrentMovie?.name ?? "")")
                                .font(.system(size: 17))
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                            Spacer()
                            Text("\(viewModule.CurrentMovie?.age ?? "")+")
                                .foregroundColor(getAge(age: viewModule.CurrentMovie?.age ?? ""))
                            Button {
                                
                            } label: {
                                Image("chats")
                            }

                                
                        }
                        .padding(.horizontal,15)
                        .padding(.top,30)
                        Spacer()
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(viewModule.CurrentMovie?.tags ?? [], id: \.idTags) { tag in
                                    Text("\(tag.tagName)")
                                        .padding(.vertical,5)
                                        .padding(.horizontal,5)
                                        .foregroundColor(.white)
                                        .background(
                                            RoundedRectangle(cornerRadius: 5)
                                                .foregroundColor(Color("MyOrange"))
                                        )
                                }
                            }
                            .padding(.bottom,10)
                        }
                    }
                }
                HStack {
                    Text("Смотреть \(viewModule.CurrentMovie?.movieId ?? "")")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .padding(.leading,20)
                    Spacer()
                }
                if (mainModule.Episodes.count != 0) {
                    VideoPlayer(player: AVPlayer(url: URL(string: "http://cinema.areas.su/up/video/\(mainModule.Episodes.last?.preview ?? "")"
                        .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")!))
                        .frame(width: UIScreen.main.bounds.width, height: 210)
                        .padding(.vertical,15)
                }
                HStack {
                    Text("Описание")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .padding(.leading,20)
                    Spacer()
                }
                Text("\(viewModule.CurrentMovie?.description ?? "")")
                    .padding(.horizontal,20)
                    .padding(.vertical,15)
                    .foregroundColor(.white)
                HStack {
                    Text("Кадры")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .padding(.leading,20)
                    Spacer()
                }
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(viewModule.CurrentMovie?.images ?? [],id:\.self) { img in
                                KFImage(URL(string: "http://cinema.areas.su/up/images/\(img)"))
                                    .resizable()
                                    .frame(width: 128, height: 72)
                        }
                    }
                }
                .padding(.vertical,15)
                .padding(.horizontal,20)
                HStack {
                    Text("Эпизоды")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .padding(.leading,20)
                    Spacer()
                }
                VStack {
                    ForEach(mainModule.Episodes, id:\.episodeId) { episode in
                        HStack {
                            KFImage(URL(string: "http://cinema.areas.su/up/images/\(episode.images?.last ?? "")"))
                                .resizable()
                                .frame(width: 128, height: 72)
                            VStack {
                                Text("\(episode.name)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                                    .fontWeight(.heavy)
                                Text("\(episode.description)")
                                    .lineLimit(2)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                                HStack {
                                    Text("\(episode.year)")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12))
                                    Spacer()
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal,20)
                .onAppear {
                    mainModule.GetEpisode(movieId: viewModule.CurrentMovie?.movieId ?? "")
                    debugPrint(mainModule.Episodes)
                }
            }
        }
        .background(
            Color("fonts")
        )
        .ignoresSafeArea()
        .onAppear {
            viewModule.getCurrentMovie()
        }
    }
}

func getAge(age : String) -> Color {
    switch age {
    case "0":
        return Color.white
    case "6":
        return Color("6+")
    case "12":
        return Color("12+")
    case "16":
        return Color("16+")
    case "18":
        return Color("18+")
    default:
        return Color.red
    }
}
