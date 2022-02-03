//
//  SignLn.swift
//  smart WatchKit Extension
//
//  Created by bnkwsr2 on 13.12.2021.
//

import SwiftUI

struct SignLn: View {
    @Binding var screen : String
    @EnvironmentObject var mainModule : MainModule
    var body: some View {
        VStack( spacing: 10) {
            Image("Logo")
            ZStack {
                if (mainModule.email.isEmpty) {
                    Text("Email")
                        .foregroundColor(.white)
                }
                TextField("", text:$mainModule.email)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width-10, height: 40)
                    .multilineTextAlignment(.center)
            }
            ZStack {
                if (mainModule.password.isEmpty) {
                    Text("Password")
                        .foregroundColor(.white)
                }
                SecureField("", text:$mainModule.password)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width-10, height: 40)
                    .multilineTextAlignment(.center)
            }
            .padding(.vertical,10)
            Button {
                withAnimation {
                    screen = "MainScreen"
                }
                mainModule.LoginLn()
            } label: {
                Text("Войти")
                    .foregroundColor(.white)
                    .background(
                    RoundedRectangle(cornerRadius: 10)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width-10, height: 40)
                    .foregroundColor(Color("MyOrange"))
                    )
            }
            .buttonStyle(PlainButtonStyle())
            Spacer()
        }
        .padding(.horizontal,15)
        .background(Color("fonts"))
    }
}

