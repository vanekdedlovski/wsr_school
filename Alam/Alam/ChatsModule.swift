//
//  WCUsersModule.swift
//  Alam
//
//  Created by bnkwsr2 on 04.12.2021.
//

import Foundation
import Alamofire

class ChatsModule : ObservableObject {
    @Published var Chats:[Chat] = []
    func GetChats() {
        AF.request("http://cinema.areas.su/chats/4", method: .get)
            .responseDecodable(of: [Chat].self) { res in
                debugPrint(res)
                self.Chats = res.value ?? []
            }
        }
    
    struct Chat : Codable {
        let chatId : String
        let name : String
    }
}
