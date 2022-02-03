//
//  MainModule.swift
//  smart WatchKit Extension
//
//  Created by bnkwsr2 on 13.12.2021.
//

import Foundation
import Alamofire
import Kingfisher

class MainModule : ObservableObject {
    @Published var email = "test@mail.ru"
    @Published var password = "test"
    @Published var token = ""
    @Published var error = ""
    @Published var Chats:[Chat] = []
    @Published var Movies:[Movie] = []
    @Published var movie:Movie?
    func LoginLn() {
            let login = Login(email: email, password: password)
            token = ""
            error = ""
            AF.request("http://cinema.areas.su/auth/login", method: .post, parameters: login)
                .responseDecodable(of: TokenType.self) { res in
                    debugPrint(res)
                    self.token = "\(res.value?.token ?? 0)"
                }
                    
                .responseString { [self] res in
                    if (token == "") {
                        error = res.value ?? ""
                    }
                }
    }
    func GetChats() {
        var headers = HTTPHeaders()
        headers.add(HTTPHeader(name: "Authorization", value: "Bearer \(token)"))
        AF.request("http://cinema.areas.su/user/chats", method: .get,headers: headers)
            .responseDecodable(of: [Chat].self) { res in
                    self.Chats = res.value ?? []
            }
    }
    func GetUsersMovies() {
        var headers = HTTPHeaders()
        headers.add(HTTPHeader(name: "Authorization", value: "Bearer \(token)"))
        AF.request("http://cinema.areas.su/usermovies?filter=compilation", method: .get, headers: headers)
            .responseDecodable(of: [Movie].self) { res in
                debugPrint(res)
                self.Movies = res.value ?? []
            }
    }
}
struct Login : Encodable {
    let email : String
    let password : String
}
struct TokenType : Decodable {
    let token : Int
}
struct Chat : Codable {
    let id : String = UUID().uuidString
    let chatId : String
    let name : String
}
struct Movie : Codable {
    let movieId : String
    let name : String
    let description : String
    let age : String
    let images : [String]?
    let poster : String
    let tags : [Tag]?
}
struct Tag : Codable {
    let idTags : String
    let tagName : String
}
