//
//  Screen2.swift
//  ozon
//
//  Created by bnkwsr2 on 14.01.2022.
//

import SwiftUI
import Kingfisher

struct Screen2: View {
    @Binding  var screen : String
    @State var activeTab = "search1"
    @EnvironmentObject var mainModule : MainModule
    var body: some View {
        ScrollView {
            VStack {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: UIScreen.main.bounds.width / 2 - 50))]) {
                    ForEach(mainModule.Allproduct, id:\.id) { productT in
                        VStack {
                            KFImage(URL(string: productT.image))
                               
                                .resizable()
                               
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 180, height: 100)
                            HStack {
                                
                                Text("\(String(format: "%.2f", productT.price))₽")
                                    .foregroundColor(.pink)
                                    .padding(.leading,20)
                                Text("\(String(format: "%.2f", (productT.price + productT.price * 0.1)))₽")
                                    .foregroundColor(.gray)
                                    .strikethrough()
                                Spacer()
                            }
                            Text(productT.title)
                                .padding(.leading,8)
                                .foregroundColor(.gray)
                                .lineLimit(1)
                            HStack {
                                ForEach(0..<Int(productT.rating.rate.rounded()), id: \.self) { _ in
                                        Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                }
                                Spacer()
                            }
                            .padding(.leading,20)
                            Spacer()
                            HStack {
                                Button {
                                    
                                } label: {
                                    Text("В корзину")
                                        .foregroundColor(.white)
                                        .background(
                                            RoundedRectangle(cornerRadius: 5)
                                                .foregroundColor(.blue)
                                                .frame(width: 90, height: 30)
                                        )
                                }
                                Spacer()
                            }
                            .padding(.leading,20)
                            Spacer()
                            HStack {
                                Text("Доставка Ozon")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            .padding(.leading,20)
                        }
                    }
                }
            }
        }
        .padding(.top,100)
        .padding(.bottom,80)
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
                    withAnimation {
                        screen = "Screen1"
                    }
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
        .onAppear {
            mainModule.GetProduct()
        }


    }
}

