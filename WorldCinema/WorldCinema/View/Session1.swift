//
//  Register and Login.swift
//  WorldCinema
//
//  Created by bnkwsr2 on 01.12.2021.
//

import SwiftUI

struct Session1: View {
    @StateObject var mainModule = MainModule()
    @Binding var screen : String
    @State var isLogin = false
    var body: some View {
        VStack {
            Image("logo")
               
            Text("WorldCinema")
                .font(.system(size: 36))
                .foregroundColor(Color("MyOrange"))
            
            if (!isLogin == true) {
                TextField("", text: $mainModule.login, prompt: Text("E-mail"))
                    .padding(.horizontal,15)
                    .frame(width: UIScreen.main.bounds.width-50, height: 50)
                .background(
                 RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color("Color1"))
                )
                SecureField("", text: $mainModule.password, prompt: Text("Пароль"))
                    .padding(.horizontal,15)
                    .frame(width: UIScreen.main.bounds.width-50, height: 50)
                .background(
                 RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color("Color1"))
                )
                VStack {
                    Button {
                        mainModule.loginIn()
                        withAnimation {
                            screen = "Session2"
                        }
                    } label: {
                        Text("Войти")
                            .frame(width: UIScreen.main.bounds.width - 50, height: 50)
                            .foregroundColor(.white)
                            .background(
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color("MyOrange"))
                            )
                    }
                    Button {
                        withAnimation {
                            isLogin = true
                        }
                    } label: {
                        Text("Зарегистрироваться")
                            .frame(width: UIScreen.main.bounds.width - 50, height: 50)
                            .foregroundColor(Color("MyOrange"))
                            .background(
                        
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 2)
                                .foregroundColor(Color("Color1"))
                            )
                        }
                }
            }
            if (isLogin == true) {
                TextField("", text: $mainModule.firstName, prompt: Text("Имя"))
                    .padding(.horizontal,15)
                    .frame(width: UIScreen.main.bounds.width-50, height: 50)
                .background(
                 RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color("Color1"))
                )
                TextField("", text: $mainModule.lastName, prompt: Text("Фамилия"))
                    .padding(.horizontal,15)
                    .frame(width: UIScreen.main.bounds.width-50, height: 50)
                .background(
                 RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color("Color1"))
                )
                TextField("", text: $mainModule.login, prompt: Text("E-mail"))
                    .padding(.horizontal,15)
                    .frame(width: UIScreen.main.bounds.width-50, height: 50)
                .background(
                 RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color("Color1"))
                )
                SecureField("", text: $mainModule.password, prompt: Text("Пароль"))
                    .padding(.horizontal,15)
                    .frame(width: UIScreen.main.bounds.width-50, height: 50)
                .background(
                 RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color("Color1"))
                )
                SecureField("", text: $mainModule.password, prompt: Text("Повторите пароль"))
                    .padding(.horizontal,15)
                    .frame(width: UIScreen.main.bounds.width-50, height: 50)
                .background(
                 RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color("Color1"))
                )
                VStack {
                    Button {
                        mainModule.RegisterIn()
                        withAnimation {
                            screen = "Session2"
                        }
                    } label: {
                        Text("Зарегистрироваться")
                            .frame(width: UIScreen.main.bounds.width - 50, height: 50)
                            .foregroundColor(.white)
                            .background(
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color("MyOrange"))
                            )
                    }
                    Button {
                        withAnimation {
                            isLogin = false
                        }
                    } label: {
                        Text("У меня уже есть аккаунт!")
                            .frame(width: UIScreen.main.bounds.width - 50, height: 50)
                            .foregroundColor(Color("MyOrange"))
                            .background(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 2)
                                .foregroundColor(Color("Color1"))
                            )
                        }
                }
            }
            Text("\(mainModule.token)")
            Text("\(mainModule.error)")
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(
            Color("fonts")
        )
    }

}
    

