//
//  Session1.swift
//  cinema
//
//  Created by bnkwsr2 on 08.12.2021.
//

import SwiftUI

struct Session1: View {
    @Binding var screen : String
    @EnvironmentObject var mainModule : MainModule
    @State var isLogin = true
    var body: some View {
        VStack {
            Spacer()
            Image("logo")
            Text("WorldCinema")
                .font(.system(size: 36))
                .foregroundColor(Color("MyOrange"))
            Spacer()
            if (isLogin == true) {
                TextField("", text:$mainModule.email, prompt: Text("E-mail"))
                    .foregroundColor(.gray)
                    .padding(.leading,10)
                    .frame(width: 343, height: 44)
                    .background(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color(.gray), lineWidth: 2)
                            
                    )
                SecureField("", text:$mainModule.password, prompt: Text("Пароль"))
                    .foregroundColor(.gray)
                    .padding(.leading,10)
                    .frame(width: 343, height: 44)
                    .background(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color(.gray), lineWidth: 2)
                    )
                Spacer()
                Button {
                    mainModule.LoginLn {
                        screen = "Session2"
                    }
                } label: {
                    Text("Войти")
                        .frame(width: 343, height: 44)
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 3)
                                .foregroundColor(Color("MyOrange"))
                        )
                }
                Button {
                    withAnimation {
                        isLogin = false
                    }
                } label: {
                    Text("Регистрация")
                        .frame(width: 343, height: 44)
                        .foregroundColor(Color("MyOrange"))
                        .background(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color(.gray), lineWidth: 2)
                        )
                }
            }
            if (isLogin == false ) {
                TextField("", text:$mainModule.firstName, prompt: Text("Имя"))
                    .foregroundColor(.gray)
                    .padding(.leading,10)
                    .frame(width: 343, height: 44)
                    .background(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color(.gray), lineWidth: 2)
                            
                    )
                TextField("", text:$mainModule.lastName, prompt: Text("Фамилия"))
                    .foregroundColor(.gray)
                    .padding(.leading,10)
                    .frame(width: 343, height: 44)
                    .background(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color(.gray), lineWidth: 2)
                            
                    )
                TextField("", text:$mainModule.email, prompt: Text("E-mail"))
                    .foregroundColor(.gray)
                    .padding(.leading,10)
                    .frame(width: 343, height: 44)
                    .background(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color(.gray), lineWidth: 2)
                            
                    )
                SecureField("", text:$mainModule.password, prompt: Text("Пароль"))
                    .foregroundColor(.gray)
                    .padding(.leading,10)
                    .frame(width: 343, height: 44)
                    .background(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color(.gray), lineWidth: 2)
                    )
                SecureField("", text:$mainModule.password2, prompt: Text("Повторите пароль"))
                    .foregroundColor(.gray)
                    .padding(.leading,10)
                    .frame(width: 343, height: 44)
                    .background(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color(.gray), lineWidth: 2)
                    )
                Spacer()
                Button {
                    mainModule.RegisterLn()
                    screen = "Session2"
                } label: {
                    Text("Зарегистрироватся")
                        .frame(width: 343, height: 44)
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 3)
                                .foregroundColor(Color("MyOrange"))
                        )
                }
                Button {
                    withAnimation {
                        isLogin = true
                    }
                } label: {
                    Text("У меня уже есть аккаунт")
                        .frame(width: 343, height: 44)
                        .foregroundColor(Color("MyOrange"))
                        .background(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color(.gray), lineWidth: 2)
                        )
                }
            }
            Spacer()
            
                
            
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(
            
            Color("fonts")
            
        )
        .alert(isPresented:$mainModule.isPresent) {
            Alert(title: Text("Error"), message: Text("\(mainModule.error)"))
        }
        .alert(isPresented:$mainModule.isPresent) {
            Alert(title: Text("OK"), message: Text("\(mainModule.error)"))
        }
    }
}

