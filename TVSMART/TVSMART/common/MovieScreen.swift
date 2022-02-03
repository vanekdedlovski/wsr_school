//
//  MovieScreen.swift
//  TVSMART
//
//  Created by bnkwsr2 on 16.12.2021.
//

import SwiftUI
import Kingfisher
import AVKit

struct MovieScreen: View {
    @EnvironmentObject var viewModule : ViewModule
    @EnvironmentObject var mainModule : MainModule
    @Binding var screen : String
    @State var IsEpidose = false
    var body: some View {
        ScrollView(.vertical) {
            if ( IsEpidose == false ) {
                VStack {
                    Button {
                        screen = "MainScreen"
                     
                    } label: {
                        Text("Назад")
                            .frame(width: 210, height: 60)
                            .foregroundColor(.white)
                            .background(
                                Color("MyOrange")
                            )
                            .multilineTextAlignment(.center)
                    }
                    .buttonStyle(PlainButtonStyle())
                    HStack {
                        KFImage(URL(string: "http://cinema.areas.su/up/images/\(viewModule.CurrentMovie?.poster ?? "")"))
                            .resizable()
                            .frame(width: 500, height: 500)
                            .onAppear {
                                mainModule.GetEpisode(movieId: viewModule.CurrentMovie?.movieId ?? "")
                            }
                        VStack {
                            HStack {
                                Text("\(viewModule.CurrentMovie?.name ?? "")(\((mainModule.Episodes.last?.year ?? ""))/\((mainModule.Episodes.first?.year ?? "")))")
                                    .font(.system(size: 40))
                                    .fontWeight(.heavy)
                                    .padding(.bottom,40)
                                Spacer()
                            }
                            Text("\(viewModule.CurrentMovie?.description ?? "")")
                                .padding(.vertical,15)
                            HStack {
                                Text("Кадры")
                                    .font(.system(size: 40))
                                    .fontWeight(.heavy)
                                    
                                Spacer()
                            }
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(viewModule.CurrentMovie?.images ?? [],id:\.self) { img in
                                        Button {
                                            
                                        } label: {
                                            KFImage(URL(string: "http://cinema.areas.su/up/images/\(img)"))
                                                .resizable()
                                                .frame(width: 450, height: 200)
                                        }

                                    }
                                }
                            }
                           
                            
                        }
                        .padding(.leading,20)
                       
                        
                    }
                }
                VStack {
                    HStack {
                        Text("Cписок эпизодов")
                            .font(.system(size: 40))
                            .fontWeight(.heavy)
                            .padding(.bottom,40)
                        Spacer()
                    }
                    VStack {
                        ForEach(mainModule.Episodes, id:\.episodeId) { episode in
                            VStack {
                                HStack {

                                    Text("\(episode.name)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24))
                                        .fontWeight(.heavy)
                                    Spacer()
                                }

                                Text("\(episode.description)")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 18))
                                Button {
                                    IsEpidose = true
                                } label: {
                                    KFImage(URL(string: "http://cinema.areas.su/up/images/\(episode.images?.last ?? "")"))
                                        .resizable()
                                        .frame(width: 450, height: 200)
                                }


                            }
                        }
                    }

                }
                .onAppear {
                    viewModule.getCurrentMovie()
                    mainModule.GetEpisode(movieId: viewModule.CurrentMovie?.movieId ?? "")
                
                }
            } else {
                VStack {
                    Button {
                        IsEpidose = false
                     
                    } label: {
                        Text("Назад")
                            .frame(width: 210, height: 60)
                            .foregroundColor(.white)
                            .background(
                                Color("MyOrange")
                            )
                            .multilineTextAlignment(.center)
                    }
                    .buttonStyle(PlainButtonStyle())
                    VideoPlayer(player: AVPlayer(url: URL(string: "http://cinema.areas.su/up/video/\(mainModule.Episodes.last?.preview ?? "")".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")!))
                        .frame(width: 800, height: 600)
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    
            }
            
           
                
        }
        .background(
            Color("fonts")
        )
        
        
    }
}

