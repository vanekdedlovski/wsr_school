//
//  Screen3.swift
//  ozon
//
//  Created by bnkwsr2 on 14.01.2022.
//

import SwiftUI

struct Screen3: View {
    @Binding var screen : String
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text("Hello, World!")
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button {
            screen = "Screen2"
        } label: {
            Text("knopka")
        }

    }
}


