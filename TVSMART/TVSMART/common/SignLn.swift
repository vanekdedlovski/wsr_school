//
//  SignLn.swift
//  TVSMART
//
//  Created by bnkwsr2 on 16.12.2021.
//

import SwiftUI

struct SignLn: View {
    @Binding var screen : String
    @EnvironmentObject var mainModule : MainModule
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .frame(width: 500, height: 270)
            Text("WorldCinema")
                .foregroundColor(Color("MyOrange"))
                .font(.system(size:100))
                .fontWeight(.bold)
            Spacer()
            TextField("",text: $mainModule.email, prompt: Text("E-mail"))
                .background(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(Color(.gray), lineWidth: 2)
                )
                .frame(width: 500, height: 44)
                .textFieldStyle(PlainTextFieldStyle())
            SecureField("", text: $mainModule.password, prompt: Text("Password"))
                .background(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(Color(.gray), lineWidth: 2)
                )
                .frame(width: 500, height: 44)
                .padding(.top,20)
                .textFieldStyle(PlainTextFieldStyle())
            Spacer()
            Button {
                mainModule.LoginLn {
                    screen = "MainScreen"
                }
            } label: {
                Text("Войти")
                    .foregroundColor(.white)
                    .frame(width: 500, height: 44)
                    .background(
                        Color("MyOrange")
                       
                    )
            }
            .padding(.bottom,50)
            .buttonStyle(PlainButtonStyle())

        }
        .ignoresSafeArea()
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(
            Color("fonts")
        )
    }
}

