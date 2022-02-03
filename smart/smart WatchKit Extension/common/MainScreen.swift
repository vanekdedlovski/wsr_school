//
//  MainScreen.swift
//  smart WatchKit Extension
//
//  Created by bnkwsr2 on 13.12.2021.
//

import SwiftUI

struct MainScreen: View {
    @Binding var screen : String
    @EnvironmentObject var mainModule : MainModule
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation {
                        screen = "SignLn"
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
            HStack(alignment: .top) {
                VStack {
                    Button {
                        withAnimation {
                            screen = "ChatsList"
                        }
                    } label: {
                        VStack {
                            Image("comments")
                                .background(
                                    Circle()
                                    .foregroundColor(Color("MyOrange"))
                                        .frame(width: 60, height: 60)
                                )
                            Text("Обсуждение")
                                .font(.system(size: 12))
                                .padding(.top,10)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: WKInterfaceDevice.current().screenBounds.width / 2 - 10)
                    
                    Spacer()
                    
                    Button {
                        screen = "FavoritesScreen"
                    } label: {
                        VStack {
                            Image("heart")
                                .background(
                                    Circle()
                                    .foregroundColor(Color("MyOrange"))
                                        .frame(width: 60, height: 60)
                                )
                            Text("Избранное")
                                .font(.system(size: 12))
                                .padding(.top,10)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: WKInterfaceDevice.current().screenBounds.width / 2 - 10)
                    .padding(.top, 15)
                }
                
                VStack {
                    Button {
                        withAnimation {
                            screen = "CompilationScreen"
                        }
                    } label: {
                        VStack {
                            Image("collection")
                                .background(
                                    Circle()
                                    .foregroundColor(Color("MyOrange"))
                                        .frame(width: 60, height: 60)
                                )
                            Text("Подборка")
                                .font(.system(size: 12))
                                .padding(.top,10)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: WKInterfaceDevice.current().screenBounds.width / 2 - 10)
                }
            }
            .padding(.top, 20)
            
            
        }
        .ignoresSafeArea()
        .background(
         Color("fonts")
        )
    }
}
