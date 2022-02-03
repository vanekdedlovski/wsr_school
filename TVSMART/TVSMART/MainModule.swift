//
//  MainModule.swift
//  TVSMART
//
//  Created by bnkwsr2 on 16.12.2021.
//

import Foundation
import Alamofire
class MainModule : ObservableObject {
    @Published var email = "vasya@mail.com"
    @Published var password = "qwerty"
    @Published var error = ""
    @Published var token = ""
    @Published var Users: User?
    @Published var Filter = ""
    @Published var Movies1:[Movie] = []
    @Published var Movies2:[Movie] = []
    @Published var Movies3:[Movie] = []
    @Published var Episodes:[Episode] = []
    func LoginLn(success : @escaping () -> Void)
    {
        if (email == "" || password == "") {
            error = "Заполните все поля"
            return
        }
        
        let login = Login(email: email, password: password)
        token = ""
        error = ""
        AF.request("http://cinema.areas.su/auth/login", method: .post, parameters: login)
            .responseDecodable(of: TokenType.self) { res in
                self.token = "\(res.value!.token)"
                debugPrint(res)
                success()
            }
            .responseString { [self] res in
                if (token == "") {
                    error = res.value ?? ""
                                    }
            }
    }
    func getUsers() {
        var headers = HTTPHeaders()
        headers.add(HTTPHeader(name: "Authorization", value: "Bearer \(token)"))
        AF.request("http://cinema.areas.su/user", method: .get, headers: headers)
            .responseDecodable(of: [User].self) { res in
                debugPrint(res)
                self.Users = res.value?.last
            }
    }
    func GetMovies() {
        
        AF.request("http://cinema.areas.su/movies?filter=inTrend", method: .get)
            .responseDecodable(of: [Movie].self) { res in
                self.Movies1 = res.value ?? []
             
            }
        AF.request("http://cinema.areas.su/movies?filter=new", method: .get)
            .responseDecodable(of: [Movie].self) { res in
                self.Movies2 = res.value ?? []
             
            }
        AF.request("http://cinema.areas.su/movies?filter=forMe", method: .get)
            .responseDecodable(of: [Movie].self) { res in
                self.Movies3 = res.value ?? []
             
            }
            
            
    }
    func GetEpisode(movieId : String) {
        AF.request("http://cinema.areas.su/movies/\(movieId)/episodes")
            .responseDecodable(of: [Episode].self) { res in
                self.Episodes = res.value ?? []
                debugPrint(res)
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
struct User : Codable {
    let userId : String
    let firstName : String
    let lastName : String
    let email : String
    let avatar : String
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
struct Episode : Codable {
    let episodeId : String
    let name : String
    let description : String
    let director : String
    let stars : [String]?
    let year : String
    let images : [String]?
    let runtime : String
    let preview : String
    let moviesId : String
}

