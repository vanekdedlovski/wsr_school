//
//  Screen1.swift
//  ozon
//
//  Created by bnkwsr2 on 13.01.2022.
//

import SwiftUI

struct Screen1: View {
    @Binding  var screen : String
    @State var activeTab = "house1"
    @State var selection1 = 0
    @EnvironmentObject var mainModule : MainModule
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ScrollView(.horizontal) {
                    HStack {
                        Image("news")
                            .resizable()
                            .frame(width: 350, height: 150)
                            
                        Image("news")
                            .resizable()
                            .frame(width: 350, height: 150)
                            
                        Image("news")
                            .resizable()
                            .frame(width: 350, height: 150)
                           
                        Image("news")
                            .resizable()
                            .frame(width: 350, height: 150)
                            
                    }
                }
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(mainModule.categor, id: \.categories) { categ in
                            VStack {
                                Button {
                                    
                                } label: {
                                    VStack {
                                        Image(categ.categories)
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                        Text("\(categ.categories)")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12))
                                    }
                                }
                                Button {
                                    
                                } label: {
                                    VStack {
                                        Image(categ.categories)
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                        Text("\(categ.categories)")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12))
                                    }
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width/4)
                        }
                        ForEach(mainModule.categor, id: \.categories) { categ in
                            VStack {
                                Button {
                                    
                                } label: {
                                    VStack {
                                        Image(categ.categories)
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                        Text("\(categ.categories)")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12))
                                    }
                                }
                                Button {
                                    
                                } label: {
                                    VStack {
                                        Image(categ.categories)
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                        Text("\(categ.categories)")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12))
                                    }
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width/4)
                        }
                        ForEach(mainModule.categor, id: \.categories) { categ in
                            VStack {
                                Button {
                                    
                                } label: {
                                    VStack {
                                        Image(categ.categories)
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                        Text("\(categ.categories)")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12))
                                    }
                                }
                                Button {
                                    
                                } label: {
                                    VStack {
                                        Image(categ.categories)
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                        Text("\(categ.categories)")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12))
                                    }
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width/4)
                        }
                        
                    }
                    
                }
                .onAppear {
                    mainModule.GetCategories()
                }
                ScrollView(.horizontal) {
                    HStack(spacing: 25) {
                        Text("Истории")
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.blue)
                                    .frame(width: 80, height: 30)
                            )
                        Text("Истории")
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.blue)
                                    .frame(width: 80, height: 30)
                            )
                        Text("Истории")
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.blue)
                                    .frame(width: 80, height: 30)
                            )
                        Text("Истории")
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.blue)
                                    .frame(width: 80, height: 30)
                            )
                        Spacer()
                    }
                    .padding(.leading,20)
                }
                
                ScrollView(.horizontal) {
                    HStack {
                        Button {
                            
                        } label: {
                            Image("cart1")
                                .resizable()
                                .frame(width: 150, height: 210)
                        }
                        Button {
                            
                        } label: {
                            Image("cart2")
                                .resizable()
                                .frame(width: 150, height: 210)
                        }
                        Button {
                            
                        } label: {
                            Image("cart")
                                .resizable()
                                .frame(width: 150, height: 210)
                        }
                        Button {
                            
                        } label: {
                            Image("cart1")
                                .resizable()
                                .frame(width: 150, height: 210)
                        }
                        Button {
                            
                        } label: {
                            Image("cart2")
                                .resizable()
                                .frame(width: 150, height: 210)
                        }
                        
                        
                    }
                }
            }
            
            
            
        }
        .padding(.top,100)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(
            Color("MyGray")
        )
        .overlay(
            HStack() {
                Image(systemName: "airplane")
                    .foregroundColor(.white)
                    .frame(width: 50, height: 40)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .frame(width: 50, height: 40)
                    TextField("", text: $mainModule.poiks , prompt: Text("Искать на ozon"))
                    Image(systemName: "qrcode.viewfinder")
                        .foregroundColor(.white)
                        .frame(width: 50, height: 40)
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(.gray))
                )
                Image(systemName: "bell")
                    .foregroundColor(.white)
                    .frame(width: 50, height: 40)
            }
            .padding(.top,50)
            , alignment: .top
            
        )
        .overlay(
            HStack() {
                Button {
                    activeTab = "house1"
                } label: {
                    VStack {
                        Image(systemName: "house")
                            .foregroundColor(activeTab == "house1" ? .blue : .gray)
                        Text("Главная")
                            .font(.system(size: 12))
                            .foregroundColor(activeTab == "house1" ? .blue : .gray)
                    }
                }
                Spacer()
                Button {
                    withAnimation {
                        screen = "Screen2"
                    }
                    activeTab = "search1"
                } label: {
                    VStack {
                        Image(systemName: "doc.text.magnifyingglass")
                            .foregroundColor(activeTab == "search1" ? .blue : .gray)
                        Text("Каталог")
                            .font(.system(size: 12))
                            .foregroundColor(activeTab == "search1" ? .blue : .gray)
                    }
                }
                Spacer()
                Button {
                    activeTab = "cart1"
                } label: {
                    VStack {
                        Image(systemName: "cart")
                            .foregroundColor(activeTab == "cart1" ? .blue : .gray)
                        Text("Корзина")
                            .font(.system(size: 12))
                            .foregroundColor(activeTab == "cart1" ? .blue : .gray)
                    }
                }
                Spacer()
                Button {
                    activeTab = "heart1"
                } label: {
                    VStack {
                        Image(systemName: "heart")
                            .foregroundColor(activeTab == "heart1" ? .blue : .gray)
                        Text("Избранное")
                            .font(.system(size: 12))
                            .foregroundColor(activeTab == "heart1" ? .blue : .gray)
                    }
                }
                Spacer()
                Button {
                    activeTab = "profile1"
                } label: {
                    VStack {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(activeTab == "profile1" ? .blue : .gray)
                        Text("Мой Ozon")
                            .font(.system(size: 12))
                            .foregroundColor(activeTab == "profile1" ? .blue : .gray)
                    }
                }


                
                
                
            }
                .padding(.horizontal,30)
            .padding(.bottom,25)
            , alignment: .bottom
        )
        
    }
}

