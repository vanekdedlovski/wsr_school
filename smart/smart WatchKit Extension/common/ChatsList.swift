//
//  ChatsList.swift
//  smart WatchKit Extension
//
//  Created by bnkwsr2 on 13.12.2021.
//

import SwiftUI
import Kingfisher
struct ChatsList: View {
    @Binding var screen : String
    @EnvironmentObject var mainModule : MainModule
    
    var body: some View {
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
            HStack {
                Text("Обсуждение")
                    .fontWeight(.heavy)
                    .padding(.leading,10)
                    .foregroundColor(Color("MyOrange"))
                    
                Spacer()
            }
            ScrollView(.vertical) {
                ForEach(mainModule.Chats, id: \.id) { chat in
                    var randomNumber = Int(arc4random_uniform(10)) + 1
                    Button {
                        
                    } label: {
                        HStack {
                            Text("\(chat.name)")
                                .font(.system(size: 12))
                                .fontWeight(.heavy)
                            Text("\(randomNumber)")
                        }
                    }
                }
            }
            Spacer()
        }
        .onAppear(perform: {
            mainModule.GetChats()
        })
        .ignoresSafeArea()
        .background(
         Color("fonts")
        )
    }
}




